import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datamodels/employee_data_model.dart';
import 'package:flutter_bloc_demo/features/demo_module/domain/repository/demo_repository.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';
import 'package:flutter_bloc_demo/utils/usecase.dart';

class FetchEmployeesUseCase
    extends UseCase<List<EmployeeDatamodel>, FetchEmployeesListParams> {
  DemoRepository repository;

  FetchEmployeesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<EmployeeDatamodel>>> call(
      FetchEmployeesListParams params) {
    return repository.fetchEmployeesList(
      noofRecords: params.noofRecords,
    );
  }
}

class FetchEmployeesListParams extends Equatable {
  final int noofRecords;

  const FetchEmployeesListParams({required this.noofRecords}) : super();

  @override
  List<Object> get props => [noofRecords];
}
