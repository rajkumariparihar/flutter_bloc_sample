import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datamodels/employee_data_model.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datasources/demo_data_source.dart';
import 'package:flutter_bloc_demo/features/demo_module/domain/repository/demo_repository.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';
import 'package:flutter_bloc_demo/utils/utils.dart';

class DemoRepositoryImpl extends DemoRepository {
  DemoDataSource demoDataSource;

  DemoRepositoryImpl({required this.demoDataSource});

  @override
  Future<Either<Failure, List<EmployeeDatamodel>>> fetchEmployeesList({
    required int noofRecords,
  }) async {
    try {
      final result =
          await demoDataSource.fetchEmployeesList(noofRecords: noofRecords);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
