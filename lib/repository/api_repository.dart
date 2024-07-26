import 'package:new_test/model/employ_model.dart';

import '../data_source/api_provider.dart';

class ApiRepository {
  final apiProvider =  ApiProvider();


  Future<EmployeeDataModel?> fetchListEmployee() {
    return apiProvider.fetchdata();
  }
}
