part of 'doctor_appointments_bloc.dart';

@immutable
abstract class DoctorAppointmentsEvent {}

class GetAllDoctorAppointmentsEvent extends DoctorAppointmentsEvent {
  final String? query;
  final int? departmentId;

  GetAllDoctorAppointmentsEvent({
    this.query,
    this.departmentId,
  });
}

class MarkCalledDoctorAppointmentEvent extends DoctorAppointmentsEvent {
  final int appointmentId;

  MarkCalledDoctorAppointmentEvent({
    required this.appointmentId,
  });
}

class SetConditionDoctorAppointmentEvent extends DoctorAppointmentsEvent {
  final int appointmentId;
  final String condition;

  SetConditionDoctorAppointmentEvent({
    required this.appointmentId,
    required this.condition,
  });
}

class SetPrescriptionDoctorAppointmentEvent extends DoctorAppointmentsEvent {
  final int appointmentId;
  final String prescription;

  SetPrescriptionDoctorAppointmentEvent({
    required this.appointmentId,
    required this.prescription,
  });
}

class DeleteDoctorAppointmentEvent extends DoctorAppointmentsEvent {
  final int appointmentId;

  DeleteDoctorAppointmentEvent({required this.appointmentId});
}
