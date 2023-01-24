import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marriage_event/pages/auth/auth_state.dart';
import 'package:marriage_event/pages/auth/firebase/firebase_auth_fuctions.dart';
import 'package:marriage_event/utils/custom_widgets.dart';
import 'package:marriage_event/utils/dimensions.dart';

import '../../utils/app_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey();

  bool startLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Dimensions.screenHeight,
          width: Dimensions.screenWidth,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/auth/auth_background.jpg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 70),

                //match a muslim text
                Image.asset('assets/images/match_a_muslim.png'),
                const SizedBox(height: 30),
                //brand logo
                Image.asset('assets/images/logo.png',
                    height: 100, width: 100, fit: BoxFit.cover),
                SizedBox(height: 20),
                CustomWidgets.TitleText('Create an Account', Colors.black),
                SizedBox(height: 20),

                //form
                Form(
                    child: Column(children: [
                  CustomWidgets.textFormFiled(
                      'Email', emailController, Icons.email),
                  CustomWidgets.textFormFiled(
                      'password', passwordController, Icons.password),
                  SizedBox(height: 20),
                  buildButton(),
                ])),
                const SizedBox(height: 20),

                //don't have account and signup text and button area
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Already have an account? ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextButton(
                      onPressed: () {},
                      child: Text('Sign in',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)))
                ]),

                //bottom area text message
                const Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                            'We have no affiliation with other marriage events or dating apps',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500)),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return InkWell(
      onTap: () async {
        setState(() {
          startLoading = true;
        });
        await FirebaseAuthFunctions().createUserWithEmailAndPassword(
            emailController.text, passwordController.text);
        if (FirebaseAuth.instance.currentUser!.uid.isNotEmpty) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AuthState()));
        }
        setState(() {
          startLoading = false;
        });
      },
      child: Container(
        height: 43,
        width: 264,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: startLoading
              ? const CircularProgressIndicator()
              : const Text(
                  'Continue',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
        ),
      ),
    );
  }
}
