import 'package:flutter_bloc_demo/features/demo_module/data/datamodels/employee_data_model.dart';

abstract class DemoDataSource {
  Future<List<EmployeeDatamodel>> fetchEmployeesList({
    required int noofRecords,
  });
}
