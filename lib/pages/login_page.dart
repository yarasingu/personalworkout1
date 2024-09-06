import 'package:flutter/material.dart';
import 'package:personalworkout/components/my_button.dart';
import 'package:personalworkout/components/my_text_field.dart';
import 'package:personalworkout/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  void login() async {
    try {
      await _auth.loginEmailPassword(emailController.text, pwController.text);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Wellcome back've have been missed",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: "Enter email...",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: pwController,
                  hintText: " Enter Password...",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MyButton(
                  text: "Login",
                  onTap: login,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
