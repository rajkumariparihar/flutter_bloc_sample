import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datamodels/employee_data_model.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datasources/demo_data_source.dart';
import 'package:flutter_bloc_demo/utils/dio_api_client.dart';

class DemoDataSourceImpl extends DemoDataSource {
  int? defaultTimeout = 120;

  Dio? client;

  DemoDataSourceImpl() {
    client = dcSl<DioApiClient>().getApiClient();
  }

  @override
  Future<List<EmployeeDatamodel>> fetchEmployeesList({
    required int noofRecords,
  }) async {
    Response? response = await client?.get(
      'https://hub.dummyapis.com/employee?noofRecords=$noofRecords',
    );
    // if (utf8.decode(response?.data).isEmpty) {
    //   return [];
    // }
    return employeeDatamodelFromJson(jsonEncode(response?.data));
  }
}
