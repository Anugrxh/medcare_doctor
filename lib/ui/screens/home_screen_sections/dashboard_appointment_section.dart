import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcare_doctor/ui/screens/issued_tokens_screen.dart';

import '../../../blocs/doctor_appointments/doctor_appointments_bloc.dart';
import '../../widgets/custom_action_button.dart';
import '../../widgets/custom_alert_dialog.dart';

class DashboardAppointmentSection extends StatefulWidget {
  const DashboardAppointmentSection({super.key});

  @override
  State<DashboardAppointmentSection> createState() =>
      _DashboardAppointmentSectionState();
}

class _DashboardAppointmentSectionState
    extends State<DashboardAppointmentSection> {
  String? _query;
  int? _departmentId;

  final DoctorAppointmentsBloc appointmentBloc = DoctorAppointmentsBloc();

  @override
  void initState() {
    appointmentBloc.add(GetAllDoctorAppointmentsEvent());
    super.initState();
  }

  void search() {
    appointmentBloc.add(
      GetAllDoctorAppointmentsEvent(
        query: _query,
        departmentId: _departmentId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1000,
          child: BlocProvider<DoctorAppointmentsBloc>.value(
            value: appointmentBloc,
            child:
                BlocConsumer<DoctorAppointmentsBloc, DoctorAppointmentsState>(
              listener: (context, state) {
                if (state is DoctorAppointmentsFailureState) {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      title: 'Failure',
                      message: state.message,
                      primaryButtonLabel: 'Ok',
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: state is DoctorAppointmentsSuccessState
                          ? state.appointments.isNotEmpty
                              ? IssuedTokensScreen(
                                  onSearch: () {
                                    search();
                                  },
                                  fromDashboard: true,
                                  appointmentDetails: state.appointments[0],
                                  appointmentsBloc: appointmentBloc,
                                )
                              : const Center(
                                  child: Text('No Appointments Found!'))
                          : state is DoctorAppointmentsFailureState
                              ? Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomActionButton(
                                        iconData: Icons.replay_outlined,
                                        onPressed: () {
                                          appointmentBloc.add(
                                              GetAllDoctorAppointmentsEvent());
                                        },
                                        label: 'Retry',
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
