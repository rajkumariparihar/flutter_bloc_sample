part of 'demo_bloc.dart';

@immutable
abstract class DemoEvent {}

class OnClickEvent extends DemoEvent {
  final int count;

  OnClickEvent({required this.count});
}

class FetchEmployeesEvent extends DemoEvent {
  final int onofRecords;

  FetchEmployeesEvent({required this.onofRecords});
}
