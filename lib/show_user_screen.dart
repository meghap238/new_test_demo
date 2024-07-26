import 'package:flutter/material.dart';

import 'model/create_model.dart';

class ShowUserScreen extends StatefulWidget {
  final CreateModel create;
  const ShowUserScreen({super.key,  required this.create});

  @override
  State<ShowUserScreen> createState() => _ShowUserScreenState();}
class _ShowUserScreenState extends State<ShowUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('detail Screen'),),
      body: Column(children: [
        Text(widget.create.data?.name ?? 'abc'),
        Text(widget.create.data?.salary ?? '12000'),
      Text(widget.create.data?.age ?? '22'),

      ],),
    );
  }
}
