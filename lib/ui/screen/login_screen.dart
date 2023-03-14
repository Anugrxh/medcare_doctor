import 'package:flutter/material.dart';
import 'package:medcare_doctor/ui/screen/home_screen.dart';

import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool checkIsEmail(String value) {
    RegExp emailRegEx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (emailRegEx.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 235, 233),
      body: Form(
        key: formkey,
        child: Row(
          children: [
            Expanded(
                child: Image.asset(
              "assets/image/doctor.png",
            )),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            checkIsEmail(value)) {
                          return null;
                        } else {
                          return 'enter valid email';
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: 'E-mail',
                          suffixIcon: Icon(Icons.person)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return 'enter password';
                        }
                      },
                      obscureText: isObscure,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              child: Icon(isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    },
                    label: 'Login',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
