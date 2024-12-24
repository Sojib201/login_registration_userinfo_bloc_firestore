import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_registration_userinfo_bloc_firebase/registrationScreen.dart';
import 'package:login_registration_userinfo_bloc_firebase/style.dart';

import 'bloc/registration/registration_bloc.dart';
import 'bloc/registration/registration_state.dart';
import 'helper/auth_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: AppInputDeceration("Email"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passController,
              decoration: AppInputDeceration("Password"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passController.text;
                // final name = nameController.text;
                // final age = ageController.text;
                //
                // final currentState =
                //     context.read<RegistrationBloc>().state;
                // String? userType;
                //
                // if (currentState is DropDownLoadedState) {
                //   userType = currentState.selectedItem;
                //   print((userType));
                // }
                //print(userType.toString());

                // context.read<RegistrationBloc>().add(
                //   RegisterUser(email, name, age, password, userType),
                // );

                final AuthHelper obj = AuthHelper();
                obj.SignIn(email, password, context);
                print('login success');
              },
              child: SuccessButtonChild("Login"),
              style: AppButtonStyle(),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have a account?",
                          style: HeadText7(colorDarkBlue),
                        ),
                        Text(
                          " Register",
                          style: HeadText7(colorGreen),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
