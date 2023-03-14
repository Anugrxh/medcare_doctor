part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleState {}

class ScheduleInitialState extends ScheduleState {}

class ScheduleLoadingState extends ScheduleState {}

class ScheduleSuccessState extends ScheduleState {
  final List<Map<String, dynamic>> prescriptions;
  ScheduleSuccessState(this.prescriptions);
}

class ScheduleFailureState extends ScheduleState {}
