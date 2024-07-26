import 'package:flutter/material.dart';
import 'package:new_test/api_integration.dart';
import 'package:new_test/config/app_color.dart';
import 'package:new_test/wigdet.dart';

class UserInformPage extends StatefulWidget {
  const UserInformPage({super.key});

  @override
  State<UserInformPage> createState() => _UserInformPageState();
}

class _UserInformPageState extends State<UserInformPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ApiIntegration().userInformation(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(

                  //style: ListTileStyle(),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1,color: AppColor.blackClr)),
                  onTap: () {

                  },
                  title: AllWidgets.textWidget(data: snapshot.data?.data![index].id.toString() ?? ''),
                subtitle: AllWidgets.textWidget(data: snapshot.data?.data![index].lastName ?? ''),
                leading: AllWidgets.textWidget(data: snapshot.data?.data![index].firstName ?? ''),
                             trailing: AllWidgets.textWidget(data: snapshot.data?.data![index].email ?? ''),
                ),
              );
            },
            itemCount: snapshot.data?.data?.length,
          );
        },
      ),
    );
  }
}
