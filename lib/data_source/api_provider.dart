import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_test/model/create_model.dart';
import 'package:new_test/model/employ_model.dart';

import '../model/post_model.dart';

class ApiProvider{
  Future<EmployeeDataModel?>fetchdata() async{
    try{
      String getData = 'https://dummy.restapiexample.com/api/v1/employees';
      var url = Uri.parse(getData);
      http.Response response = await http.get(url);
      if(response.statusCode == 200){
        print(response.body);
        return EmployeeDataModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('failed to error');
      }
    }

catch(e){
      print(e);
}
  }
  Future<List<PostUserModel>?>fetchdataPost() async{
    try{
      String getData = 'https://jsonplaceholder.typicode.com/posts';
      var url = Uri.parse(getData);
      http.Response response = await http.get(url);
      if(response.statusCode == 200){
        print(response.body);
        List body = jsonDecode(response.body);
       // List<dynamic> body = jsonDecode(response.body);
        return body.map((x)=> PostUserModel.fromJson(x)).toList();
        //map((dynamic item) => PostUserModel.fromJson(item)).toList();
        //return EmployeeDataModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('failed to error');
      }
    }

    catch(e){
      print(e);
    }
  }


}