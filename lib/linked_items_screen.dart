import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_test/user_detail_model.dart';

class LinkedItemsScreen extends StatefulWidget {
  List<UserDetailModel>likedItems = [];
   LinkedItemsScreen({super.key,required this.likedItems});

  @override
  State<LinkedItemsScreen> createState() => _LinkedItemsScreenState();
}

class _LinkedItemsScreenState extends State<LinkedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:(widget.likedItems == null || widget.likedItems.isEmpty) ? Center(child: Text('no data'),) :ListView.builder(itemBuilder: (context, index) {
return ListTile(leading: Text(widget.likedItems[index].title ?? ''),);
      },
      itemCount: widget.likedItems.length,),
    );
  }
}
