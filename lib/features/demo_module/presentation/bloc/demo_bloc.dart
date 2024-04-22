import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datamodels/employee_data_model.dart';
import 'package:flutter_bloc_demo/features/demo_module/domain/usecases/fetch_employees_use_case.dart';
import 'package:meta/meta.dart';
part 'demo_event.dart';
part 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  final FetchEmployeesUseCase fetchEmployeesUseCase;
  DemoBloc({
    required this.fetchEmployeesUseCase,
  }) : super(DemoInitial()) {
    on<OnClickEvent>(
      (event, emit) async {
        emit(OnClickState(count: event.count + 1));
      },
    );
    on<FetchEmployeesEvent>(
      (event, emit) async {
        //  emit(LoadingDropDownBeginState());
        final result = await fetchEmployeesUseCase(FetchEmployeesListParams(
          noofRecords: event.onofRecords,
        ));
        // emit(LoadingDropDownEndState());
        emit(result.fold(
          (error) => ErrorState(error.message),
          (success) => FetchEmployeesState(employeeList: success),
        ));
      },
    );
  }
}
