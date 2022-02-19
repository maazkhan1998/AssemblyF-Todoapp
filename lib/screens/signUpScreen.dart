import 'package:flutter/material.dart';
import 'package:todoapp/screens/landingScreen.dart';
import 'package:todoapp/services/authServices.dart';
import 'package:todoapp/shared/customButton.dart';
import 'package:todoapp/shared/customTextField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthServices _authServices = AuthServices();

  bool isCreatingUser = false;

  onSignUp() async {
    try {
      print("Hello");
      await _authServices.signUpUser(
          emailController.text.trim(), passwordController.text.trim());

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LandingScreen()),
          (route) => false);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SignUp Screen'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'AssemblyF',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                const SizedBox(
                  height: 180,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomTextField(
                    controller: emailController,
                    hintText: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: CustomTextField(
                    controller: passwordController,
                    hintText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                CustomButton(
                  child: isCreatingUser
                      ? CircularProgressIndicator()
                      : Text("Sign Up"),
                  onPress: onSignUp,
                ),
                Row(
                  children: <Widget>[
                    const Text('Already have an account?'),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            )));
  }
}
