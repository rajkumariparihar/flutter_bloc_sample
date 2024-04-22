import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
