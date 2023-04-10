import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../blocs/dashbord/dashboard_count/dashboard_count_bloc.dart';
import '../../../blocs/dashbord/doctors_token_count/doctors_token_count_bloc.dart';
import '../../widgets/custom_action_button.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_search.dart';
import '../../widgets/dashcard.dart';
import '../../widgets/department_selector.dart';
import 'dashboard_appointment_section.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DoctorsTokenCountBloc doctorsTokenCountBloc = DoctorsTokenCountBloc();
  final DashboardCountBloc dashboardCountBloc = DashboardCountBloc();
  String? _query;
  int? _departmentId;

  @override
  void initState() {
    super.initState();
    doctorsTokenCountBloc.add(DoctorsTokenCountEvent());
    dashboardCountBloc.add(DashboardCountEvent());
  }

  void search() {
    doctorsTokenCountBloc.add(
      DoctorsTokenCountEvent(
        query: _query,
        departmentId: _departmentId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1000,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<DoctorsTokenCountBloc>.value(
              value: doctorsTokenCountBloc,
            ),
            BlocProvider<DashboardCountBloc>.value(
              value: dashboardCountBloc,
            ),
          ],
          child: BlocConsumer<DashboardCountBloc, DashboardCountState>(
            listener: (context, dashboardState) {
              if (dashboardState is DashboardCountFailureState) {
                showDialog(
                  context: context,
                  builder: (context) => CustomAlertDialog(
                    title: 'Failure',
                    message: dashboardState.message,
                    primaryButtonLabel: 'Ok',
                  ),
                );
              }
            },
            builder: (context, dashboardState) {
              return BlocConsumer<DoctorsTokenCountBloc,
                  DoctorsTokenCountState>(
                listener: (context, state) {
                  if (state is DoctorsTokenCountFailureState) {
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
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Today',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        DateFormat('EEEE d MMMM y').format(DateTime.now()),
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                      ),
                      const Divider(
                        height: 40,
                        color: Color.fromARGB(66, 176, 176, 176),
                      ),
                      dashboardState is DashboardCountSuccessState
                          ? Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              children: [
                                DashCard(
                                  iconData: Icons.dvr_outlined,
                                  label: 'Called Tokens Today',
                                  value: dashboardState
                                      .dashbordCount['called_token_count']
                                      .toString(),
                                ),
                                DashCard(
                                  iconData: Icons.receipt_outlined,
                                  label: 'Total Tokens Today',
                                  value: dashboardState
                                      .dashbordCount['issued_token_count']
                                      .toString(),
                                ),
                                DashCard(
                                  iconData: Icons.person_3_outlined,
                                  label: 'Total Patients',
                                  value: dashboardState
                                      .dashbordCount['total_patient_count']
                                      .toString(),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(height: 20),
                      state is DoctorsTokenCountLoadingState ||
                              dashboardState is DashboardCountLoadingState
                          ? const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                height: 1,
                                child: LinearProgressIndicator(),
                              ),
                            )
                          : const Divider(
                              height: 1,
                              endIndent: 20,
                              indent: 20,
                            ),
                      const Expanded(
                        child: DashboardAppointmentSection(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
