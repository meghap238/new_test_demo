import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_test/api_integration.dart';
import 'package:new_test/bloc/employ_bloc.dart';
import 'package:new_test/bloc/employe_event.dart';
import 'package:new_test/config/app_string.dart';
import 'package:new_test/repository_one.dart';
import 'package:new_test/show_user_screen.dart';
import 'package:new_test/wigdet.dart';

import 'bloc/employe_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  EmployBloc empBloc = EmployBloc(ApiIntegrationProvider());
  TextEditingController nameCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  TextEditingController ageCon = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  void initState() {
    empBloc = EmployBloc(ApiIntegrationProvider());
    super.initState();
  }

  @override
  void dispose() {
    empBloc.close();
    nameCon.dispose();
    passCon.dispose();
    ageCon.dispose();
    super.dispose();
  }
  // @override
  // void initState() {
  //   // empBloc.add();
  //   //ApiIntegration().getApiData();
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('loginpage'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 130),
        child: BlocConsumer<EmployBloc,EmployeState>(
          bloc: empBloc,
          listener: (context, state) {
 if (state is CreateEmployeeSuccess) {

  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return ShowUserScreen( create: state.response,);
  }));
}
          },
        builder: (context, state) {
          print("state $state");
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {

            return Center(
              child: Text('Error: ${state.msg}'),
            );
          }
          return Form(
            key: formkey,
            child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: TextFormField(
                    controller: nameCon,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                AllWidgets.verticalSpace(),
                Flexible(
                  child: TextFormField(controller: passCon,
                    decoration: InputDecoration(hintText: 'salary',border: OutlineInputBorder()),
                  ),
                ),
                AllWidgets.verticalSpace(),
                Flexible(
                  child: TextFormField(controller: ageCon,
                    decoration: InputDecoration(hintText: 'age',border: OutlineInputBorder()),
                  ),
                ),
               /* AllWidgets.verticalSpace(),
                TextFormField(
                  controller: nameCon,
                  // validator: (value) {
                  //   print(value?.length);
                  //   if(value!.isEmpty){
                  //     return 'please enter name';
                  //   }else if(!RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(value)){
                  //     return 'Full name';
                  //   }
                  //   return null;
                  //},
                  decoration: InputDecoration(
                    hintText: AppString.enterName,
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ) ,
                  ),
                AllWidgets.verticalSpace(),
                TextFormField(
                  controller: passCon,
                  // validator: (value) {
                  //  // print(value?.length);
                  //   if(value!.isEmpty){
                  //     return 'please enter salary';
                  //   }
                  //   // else if(value.length <= 10){
                  //   //   return 'Full salary above 10 ';
                  //   // }
                  //   return null;
                  // },
                  decoration: const InputDecoration(
                    hintText: "salary",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ) ,
                ),

                AllWidgets.verticalSpace(),
                TextFormField(  controller: ageCon,
                  // validator: (value) {
                  // //  print(value?.length);
                  //   if(value!.isEmpty){
                  //     return 'please enter age';
                  //   }
                  //   else if(int.tryParse(value)! >= 100){
                  //     return 'age is less than 100 ';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    hintText: "age",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ) ,
                ),*/

                AllWidgets.verticalSpace(),
                AllWidgets.customButton(
                  onPressed: () {
                 //   if (formkey.currentState!.validate()) {
                      empBloc.add(
                        CreateEmployeeButtonPressed(
                          name: nameCon.text,
                          salary: passCon.text,
                          age: ageCon.text,
                        ),
                      );
                      nameCon.text = '';
                      passCon.text = '';
                      ageCon.text = '';

                    // }else{
                    //   print('dbahf');
                    // }
                  },
                ),
              ],
            ),
          );
        },


        ),
      )
    );
  }
}
