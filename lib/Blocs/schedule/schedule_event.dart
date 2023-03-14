part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleEvent {}

class CreatePriscriptionEvent extends ScheduleEvent {
  final String prescription, userId;
  final int patientId, doctorId;
  final DateTime date;
  CreatePriscriptionEvent({
    required this.prescription,
    required this.userId,
    required this.patientId,
    required this.doctorId,
    required this.date,
  });
}

class GetAllScheduleEvent extends ScheduleEvent {}
