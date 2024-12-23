import 'package:flutter/material.dart';
import 'package:login_registration_userinfo_bloc_firebase/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  List<String> item=['safuh','safdj'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton(style: TextStyle(color: Colors.black),
              items: List.empty(),
              onChanged: (value) => {},
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: AppInputDeceration("Email"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: AppInputDeceration("Name"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: AppInputDeceration("Age"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: AppInputDeceration("Password"),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: SuccessButtonChild("Registration"),
              style: AppButtonStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
