import 'package:flutter_bloc_demo/features/demo_module/data/datasources/demo_data_source.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datasources/demo_data_source_impl.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/repository/demo_repository_impl.dart';
import 'package:flutter_bloc_demo/features/demo_module/domain/repository/demo_repository.dart';
import 'package:flutter_bloc_demo/features/demo_module/domain/usecases/fetch_employees_use_case.dart';
import 'package:flutter_bloc_demo/features/demo_module/presentation/bloc/demo_bloc.dart';
import 'package:flutter_bloc_demo/utils/dio_api_client.dart';
import 'package:get_it/get_it.dart';

final dcSl = GetIt.instance;

Future<void> initServiceLocator(DioApiClient dioApiClient) async {
  dcSl.registerLazySingleton<DioApiClient>(() => dioApiClient);

  /// use cases here
  dcSl.registerLazySingleton(() => FetchEmployeesUseCase(repository: dcSl()));

  /// blocs here
  dcSl.registerFactory(
    () => DemoBloc(
      fetchEmployeesUseCase: dcSl(),
    ),
  );

  /// Data sources here
  dcSl.registerLazySingleton<DemoDataSource>(
    () => DemoDataSourceImpl(),
  );

  /// Repositories here
  dcSl.registerLazySingleton<DemoRepository>(
      () => DemoRepositoryImpl(demoDataSource: dcSl()));
}
