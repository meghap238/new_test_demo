import 'dart:convert';

import 'package:new_test/user_10model.dart';
import 'package:new_test/user_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:new_test/user_ifmation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class ApiIntegration{

  Future<List<UserDetailModel>?> getApiData() async{
    try{
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      http.Response response = await http.get(url,);
      if(response.statusCode == 200 ){
        print('api data : ${response.body}');
        // List<UserDetailModel> model = List<UserDetailModel>.
        // from(json.decode(response.body).map((x) => UserDetailModel.fromJson(x)));

        //Store the data in SharedPreferences
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('apiData', json.encode(model));
        List body = jsonDecode(response.body);
        // List<dynamic> body = jsonDecode(response.body);
        return body.map((x)=> UserDetailModel.fromJson(x)).toList();
       // return model;
        //return UserDetailModel.fromJson(jsonDecode(response.body));
        // List model =  List<UserDetailModel>.
       //  from(json.decode(response.body).map((x) => UserDetailModel.fromJson(x)));
       //  List<dynamic> jsonList = jsonDecode(response.body);
       //  return jsonList.map((json) => UserDetailModel.fromJson(json)).toList();
      }else{
        throw Exception('faild to lead');
      }
    }catch(e){
      print(e);
    }
  }
  Future<List<UserDetailModel>?> getStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('apiData');
    if (data != null) {
      List<dynamic> jsonList = json.decode(data);
      return jsonList.map((json) => UserDetailModel.fromJson(json)).toList();
    }
    return null;
  }
  Future<UserInformationModel?> userInformation() async{
    try{
      var url = Uri.parse('https://reqres.in/api/users');
    http.Response response = await http.get(url);
      if(response.statusCode ==200){
        return UserInformationModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('faild to lead');
      }
      }catch(e){
      print(e);
    }
  }
  Future<List<User10Model>?> getapi10() async{
    try{
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      http.Response response = await http.get(url,);
      if(response.statusCode == 200 ){
        print('api data : ${response.body}');
        List<User10Model> model = List<User10Model>.
        from(json.decode(response.body).map((x) => User10Model.fromJson(x)));
        return model;
        //return UserDetailModel.fromJson(jsonDecode(response.body));
        // List model =  List<UserDetailModel>.
        //  from(json.decode(response.body).map((x) => UserDetailModel.fromJson(x)));
        //  List<dynamic> jsonList = jsonDecode(response.body);
        //  return jsonList.map((json) => UserDetailModel.fromJson(json)).toList();
      }else{
        throw Exception('faild to lead');
      }
    }catch(e){
      print(e);
    }
  }

 }
