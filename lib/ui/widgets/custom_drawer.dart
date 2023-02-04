import 'package:flutter/material.dart';
import 'package:medcare_doctor/ui/screen/login_screen.dart';
import 'package:medcare_doctor/ui/widgets/custom_button.dart';

import 'custom_drawer_button.dart';

class CustomDrawer extends StatefulWidget {
  final Function(int index) onChanged;
  const CustomDrawer({super.key, required this.onChanged});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomDrawerButton(
              label: 'Schuedule',
              onPressed: () {
                widget.onChanged(0);
                activeIndex = 0;

                Navigator.pop(context);
              },
              isSelected: activeIndex == 0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomDrawerButton(
              label: 'Patients',
              onPressed: () {
                widget.onChanged(1);
                activeIndex = 1;

                Navigator.pop(context);
              },
              isSelected: activeIndex == 1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomDrawerButton(
              label: 'Logout',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          const  Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                           const Text(
                              'Are you sure you want to logout ?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    label: 'Cancel',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CustomButton(
                                    onTap: (() {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                    }),
                                    label: 'Logout',
                                    buttonColor: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
