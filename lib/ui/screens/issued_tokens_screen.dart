import 'package:flutter/material.dart';
import 'package:medcare_doctor/ui/screens/patient_details_screen.dart';
import 'package:medcare_doctor/ui/widgets/custom_card.dart';

import '../../blocs/doctor_appointments/doctor_appointments_bloc.dart';
import '../../util/get_age.dart';
import '../widgets/custom_action_button.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/token_card.dart';

class IssuedTokensScreen extends StatefulWidget {
  final Map<String, dynamic> appointmentDetails;
  final DoctorAppointmentsBloc appointmentsBloc;
  final Function() onSearch;
  final bool fromDashboard;
  const IssuedTokensScreen({
    super.key,
    required this.appointmentDetails,
    required this.appointmentsBloc,
    required this.onSearch,
    this.fromDashboard = false,
  });

  @override
  State<IssuedTokensScreen> createState() => _IssuedTokensScreenState();
}

class _IssuedTokensScreenState extends State<IssuedTokensScreen> {
  Map<String, dynamic>? currentToken;
  List<Map<String, dynamic>> todaysTokens = [];

  @override
  void initState() {
    super.initState();
    setCurrentToken();
    getAppointments();
  }

  void setCurrentToken() {
    DateTime currentDay = DateTime.now();
    for (int i = 0; i < widget.appointmentDetails['tokens'].length; i++) {
      DateTime bookingDateTime = DateTime.parse(
          widget.appointmentDetails['tokens'][i]['booking_date_time']);
      String status = widget.appointmentDetails['tokens'][i]['status'];

      if ((currentDay.year == bookingDateTime.year &&
          currentDay.month == bookingDateTime.month &&
          currentDay.day == bookingDateTime.day)) {
        if (status != 'pending') {
          currentToken = widget.appointmentDetails['tokens'][i];
        } else {
          break;
        }
      }
    }

    setState(() {});
  }

  void getAppointments() {
    if (widget.fromDashboard) {
      DateTime currentDay = DateTime.now();

      for (int i = 0; i < widget.appointmentDetails['tokens'].length; i++) {
        DateTime bookingDateTime = DateTime.parse(
            widget.appointmentDetails['tokens'][i]['booking_date_time']);
        String status = widget.appointmentDetails['tokens'][i]['status'];
        if (currentDay.year == bookingDateTime.year &&
            currentDay.month == bookingDateTime.month &&
            currentDay.day == bookingDateTime.day &&
            status == 'pending') {
          todaysTokens.add(widget.appointmentDetails['tokens'][i]);
        }
      }
    } else {
      DateTime currentDay = DateTime.now();

      for (int i = 0; i < widget.appointmentDetails['tokens'].length; i++) {
        DateTime bookingDateTime = DateTime.parse(
            widget.appointmentDetails['tokens'][i]['booking_date_time']);
        String status = widget.appointmentDetails['tokens'][i]['status'];
        if (currentDay.isBefore(bookingDateTime) && status == 'pending') {
          todaysTokens.add(widget.appointmentDetails['tokens'][i]);
        }
      }
    }

    setState(() {});
  }

  Map<String, dynamic>? getNextAppointments() {
    DateTime currentDay = DateTime.now();
    Map<String, dynamic>? nextAppointment;

    for (int i = 0; i < widget.appointmentDetails['tokens'].length; i++) {
      DateTime bookingDateTime = DateTime.parse(
          widget.appointmentDetails['tokens'][i]['booking_date_time']);
      String status = widget.appointmentDetails['tokens'][i]['status'];
      if (currentDay.year == bookingDateTime.year &&
          currentDay.month == bookingDateTime.month &&
          currentDay.day == bookingDateTime.day &&
          status == 'pending') {
        nextAppointment = widget.appointmentDetails['tokens'][i];
        break;
      }
    }
    return nextAppointment;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        widget.fromDashboard
            ? Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current Token',
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
                        currentToken != null
                            ? currentToken!['number'].toString()
                            : '0',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                    child: VerticalDivider(
                      width: 100,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current Patient',
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
                        currentToken != null
                            ? currentToken!['patient']['name'].toString()
                            : 'Not Called',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        currentToken != null
                            ? '${getAge(DateTime.parse(currentToken!['patient']['dob'].toString()))}  ${currentToken!['patient']['sex']}'
                            : '',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomActionButton(
                        iconData: Icons.replay_outlined,
                        onPressed: widget.onSearch,
                        label: 'Refresh',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomActionButton(
                        iconData: Icons.forward_outlined,
                        color: Colors.green,
                        onPressed: () {
                          Map<String, dynamic>? nextAppointment =
                              getNextAppointments();

                          if (nextAppointment != null) {
                            widget.appointmentsBloc.add(
                              MarkCalledDoctorAppointmentEvent(
                                appointmentId: nextAppointment['id'],
                              ),
                            );
                          }
                        },
                        label: 'Next Token',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      currentToken != null
                          ? Row(
                              children: [
                                CustomActionButton(
                                  iconData: Icons.arrow_outward,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PatientDetailsScreen(
                                          patientDetails:
                                              currentToken!['patient'],
                                        ),
                                      ),
                                    );
                                  },
                                  label: 'Patient Details',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomActionButton(
                                  iconData: Icons.medical_information_outlined,
                                  onPressed: () async {
                                    TextEditingController _controller =
                                        TextEditingController();
                                    _controller.text =
                                        currentToken!['condition'];

                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomAlertDialog(
                                        title: 'Condition',
                                        message:
                                            'Add or edit the conditions below',
                                        width: 600,
                                        content: CustomCard(
                                          child: TextField(
                                            controller: _controller,
                                            minLines: 4,
                                            maxLines: 7,
                                            decoration: const InputDecoration(
                                              hintText: 'Condition',
                                            ),
                                          ),
                                        ),
                                        primaryButtonLabel: 'Save',
                                        primaryOnPressed: () {
                                          widget.appointmentsBloc.add(
                                            SetConditionDoctorAppointmentEvent(
                                              appointmentId:
                                                  currentToken!['id'],
                                              condition:
                                                  _controller.text.trim(),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  },
                                  label: 'Add Condition',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomActionButton(
                                  iconData: Icons.document_scanner_outlined,
                                  onPressed: () {
                                    TextEditingController _controller =
                                        TextEditingController();
                                    _controller.text =
                                        currentToken!['prescription'];

                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomAlertDialog(
                                        title: 'Prescription',
                                        message:
                                            'Add or edit the prescriptions below',
                                        width: 600,
                                        content: CustomCard(
                                          child: TextField(
                                            controller: _controller,
                                            minLines: 4,
                                            maxLines: 7,
                                            decoration: const InputDecoration(
                                              hintText: 'Prescription',
                                            ),
                                          ),
                                        ),
                                        primaryButtonLabel: 'Save',
                                        primaryOnPressed: () {
                                          widget.appointmentsBloc.add(
                                            SetPrescriptionDoctorAppointmentEvent(
                                              appointmentId:
                                                  currentToken!['id'],
                                              prescription:
                                                  _controller.text.trim(),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  },
                                  label: 'Add Prescription',
                                )
                              ],
                            )
                          : const SizedBox(),
                    ],
                  )
                ],
              )
            : const SizedBox(),
        SizedBox(height: widget.fromDashboard ? 20 : 0),
        widget.fromDashboard
            ? const Divider(
                height: 1,
                endIndent: 20,
                indent: 20,
              )
            : const SizedBox(),
        SizedBox(height: widget.fromDashboard ? 20 : 0),
        const Text(
          'Upcoming Tokens',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black45,
            fontSize: 15,
          ),
        ),
        Expanded(
          child: todaysTokens.isNotEmpty
              ? SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: List<Widget>.generate(
                      todaysTokens.length,
                      (index) => TokenCard(
                        tokenDetails: todaysTokens[index],
                        onDeletePressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomAlertDialog(
                              title: 'Delete?',
                              message:
                                  'Are you sure you want to delete this appointment?',
                              primaryButtonLabel: 'Delete',
                              primaryOnPressed: () {
                                widget.appointmentsBloc.add(
                                  DeleteDoctorAppointmentEvent(
                                    appointmentId: todaysTokens[index]['id'],
                                  ),
                                );

                                todaysTokens.remove(todaysTokens[index]);
                                setState(() {});

                                Navigator.of(context).pop();
                              },
                              secondaryButtonLabel: 'Cancel',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    widget.fromDashboard
                        ? 'No Appointments Today!'
                        : 'No Upcoming Appointments',
                  ),
                ),
        ),
      ],
    );
  }
}
