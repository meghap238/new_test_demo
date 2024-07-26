import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_test/bloc/employ_bloc.dart';
import 'package:new_test/bloc/employe_state.dart';
import 'package:new_test/repository_one.dart';

import 'bloc/employe_event.dart';

class EmployeScreen extends StatefulWidget {
  const EmployeScreen({super.key});

  @override
  State<EmployeScreen> createState() => _EmployeScreenState();
}

class _EmployeScreenState extends State<EmployeScreen> {
  EmployBloc empbloc = EmployBloc(ApiIntegrationProvider());
@override
  void initState() {
  empbloc.add(GetListEmploye());
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    empbloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('employdata hrj'),),
      body: BlocBuilder<EmployBloc,EmployeState>(
        bloc: empbloc,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          else if (state is LoadedState) {
           //
            return  ListView.builder(
              itemBuilder: (context, index) {
                final emp = state.employe.data?[index];
                return ListTile(
                  title: Text(state.employe.data?[index].employeeName ?? ''),
                );
              },
              itemCount: state.employe.data?.length,
            );
          }
         else if(state is ErrorState){
            return Center(
              child: Text('Error: ${state.msg}'),
            );

         }

            return Container();


      },),
    );
  }
}
