import 'dart:html';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 235, 233),
      body: Row(
        children: [
          Expanded(
            child: Image.asset("assets/image/doctor.png",)
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150,
                
                ),
                Text(
                  "Login"
                  ,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color:Colors.black,

                  ),

                ),

                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
                ),
                hintText: 'Username',
                ),
                ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
                ),
                hintText: 'Password',
                ),
                ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              var _formKey;
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}