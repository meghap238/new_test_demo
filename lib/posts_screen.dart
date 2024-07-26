import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_test/api_integration.dart';
import 'package:new_test/user_detail_model.dart';
import 'package:new_test/wigdet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'linked_items_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<dynamic>?> _dataFuture;
  bool addIs = false;
  List<bool> likedItems = [];
  List<UserDetailModel> newList = [];
  @override
  void initState() {
    super.initState();
    _dataFuture = fetchData();
    print(_dataFuture);
   // _dataFuture?? [];
   //  fetchData();
  }

  Future<List<dynamic>?> fetchData() async {
    try {
      // Fetch data from the API
      List<dynamic>? data = await ApiIntegration().getApiData();
     //
      //
      likedItems = List<bool>.filled(data?.length ?? 0, false);
      // Save data to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('dataList', jsonEncode(data));
      return data;
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
  Future<List<dynamic>?> getStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('dataList');
    if (jsonString != null) {
      List<dynamic> dataList = jsonDecode(jsonString);
      return dataList;
    }
    return null;
  }

  // Future<void> fetchData() async {
  //   await ApiIntegration().getApiData();
  //   setState(() {
  //     _dataFuture = ApiIntegration().getStoredData();
  //   });
  // }
void  savedata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   // prefs.setStringList('dataList', _dataFuture );
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LinkedItemsScreen(likedItems: newList,),));

                        }, icon: Icon(CupertinoIcons.heart_circle_fill,color: Colors.red,size: 30,)),
            )],
        ),
        body : FutureBuilder (
          future: _dataFuture ,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data found.'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: AllWidgets.textWidget(
                        data: snapshot.data?[index].id.toString() ?? '',
                      ),
                      title: AllWidgets.textWidget(
                        data: snapshot.data?[index].title ?? '',
                        fontWeight: FontWeight.bold,
                      ),
                      subtitle: AllWidgets.textWidget(
                        data: snapshot.data?[index].body ?? '',
                      ),
                      trailing: IconButton(onPressed: () {
                        setState(() {
                          setState(() {
                            likedItems[index] = true;
                          //  !likedItems[index];
                            newList.add(snapshot.data?[index]);
                            print(newList);
                          });
                          //addIs = true;
                        });
                      }, icon: likedItems[index] == false ? Icon(CupertinoIcons.heart,color: Colors.red,) :  Icon(CupertinoIcons.heart_solid,color: Colors.red,)),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
