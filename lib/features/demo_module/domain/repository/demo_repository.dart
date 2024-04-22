import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datamodels/employee_data_model.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';

abstract class DemoRepository {
  Future<Either<Failure, List<EmployeeDatamodel>>> fetchEmployeesList({
    required int noofRecords,
  });
}
