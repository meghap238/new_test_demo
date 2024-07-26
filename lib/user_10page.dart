import 'package:flutter/material.dart';
import 'package:new_test/wigdet.dart';

import 'api_integration.dart';
import 'config/app_color.dart';

class User10page extends StatefulWidget {
  const User10page({super.key});

  @override
  State<User10page> createState() => _User10pageState();
}

class _User10pageState extends State<User10page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ApiIntegration().getapi10(),
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
                  title: AllWidgets.textWidget(data: snapshot.data?[index].phone ?? ''
                  ),
                  subtitle: AllWidgets.textWidget(data: snapshot.data?[index].name ?? ''),
                  leading: AllWidgets.textWidget(data: snapshot.data?[index].company?.name ?? ''),
                  trailing: AllWidgets.textWidget(data: snapshot.data?[index].address?.street ?? ''),
                ),
              );
            },
            itemCount: snapshot.data?.length,
          );
        },
      ),
    );
  }
}
