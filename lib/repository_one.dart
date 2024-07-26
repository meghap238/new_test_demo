import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_test/model/employ_model.dart';

import 'model/create_model.dart';

class ApiIntegrationProvider{
  Future<EmployeeDataModel?>fetchdata() async{
    try{
      String getData = 'https://dummy.restapiexample.com/api/v1/employees';
      var url = Uri.parse(getData);
      http.Response response = await http.get(url);
      if(response.statusCode == 200){
        print(response.body);
        return EmployeeDataModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('failed to error');
      }
    }

    catch(e){
      print(e);
    }
  }
  Future<CreateModel?> creatData(String name, String salary, String age) async {
    try {
      final response = await http.post(
        Uri.parse("https://dummy.restapiexample.com/api/v1/create"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'salary': salary,
          'age' :age
        }),
      );

      if (response.statusCode == 200) {
        print(response.body);
        print('${CreateModel.fromJson(jsonDecode(response.body))}');
        return CreateModel.fromJson(jsonDecode(response.body) );
      }
      else {
        throw Exception('Failed to login .');
      }
    }
    catch(e){
      print(e);
    }
  }
}