import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../../auth/auth_error.dart';
import '../login_view/login_view.dart';
import '../register_view/email_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/hello_gif.json', width: 500, fit: BoxFit.cover, reverse: true),
              const Text(
                'Hey, Welcome',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                'We deliver not only items, we deliver a\n amazing experience from your nearby shops',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.shade500, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: EmailView(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: Duration(milliseconds: 250)));
                    },
                    color: Colors.amber,
                    child: const Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: LoginView(), type: PageTransitionType.fade));
                  },
                  child: const Text(
                    'I Already have an account',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: authErrorRegister != ''
                    ? Text(
                        authErrorRegister.split(']')[1],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
