import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_registration_userinfo_bloc_firebase/views/userInfo.dart';

import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';
import '../bloc/registration/registration_bloc.dart';
import '../bloc/registration/registration_event.dart';
import '../bloc/registration/registration_state.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController ageController = TextEditingController();

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      context.read<RegistrationBloc>().add(LoadDropDownList());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Auth')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<RegistrationBloc, RegistrationState>(
                builder: (context, state) {
                  if (state is DropDownLoadedState) {
                    return DropdownButton<String>(
                      onChanged: (String? newValue) {
                        context.read<RegistrationBloc>().add(
                              DropdownItemSelected(newValue!),
                            );
                      },
                      dropdownColor: Colors.black,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 35,
                      elevation: 50,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(5),
                      iconEnabledColor: Colors.black,
                      padding: EdgeInsets.all(20),
                      underline: Container(
                        width: 10,
                        height: 2,
                        color: Colors.black,
                      ),
                      value: state.selectedItem,
                      hint: Text(
                        'User Type',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      items: state.dropdownlist.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    );
                  }
                  return Text('Empty');
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              const SizedBox(height: 16),
              BlocConsumer<SignInBloc, SignInState>(
                listener: (context, state) {
                  if (state is SignInSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserInfoScreen(),
                      ),
                    );
                  } else if (state is SignInFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SignInLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      context
                          .read<SignInBloc>()
                          .add(PerformSignIn(email, password));
                    },
                    child: const Text('Sign In'),
                  );
                },
              ),
              const SizedBox(height: 8),
              BlocConsumer<RegistrationBloc, RegistrationState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  } else if (state is SignUpFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      final name = nameController.text.trim();
                      final phone = phoneController.text.trim();
                      final age = ageController.text.trim();
                      // context.read<RegistrationBloc>().add(
                      //     RegistrationData(email, password, name, phone, age));
                    },
                    child: const Text('Sign Up'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
