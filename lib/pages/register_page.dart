import 'package:flutter/material.dart';
import 'package:personalworkout/components/my_button.dart';
import 'package:personalworkout/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmpwController = TextEditingController();

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
                  "Let's Create an account for you",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                MyTextField(
                  controller: name,
                  hintText: "Enter name...",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
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
                  height: 10,
                ),
                MyTextField(
                  controller: confirmpwController,
                  hintText: " Confirm Password...",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                MyButton(
                  text: "Register",
                  onTap: widget.onTap,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member? ",
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
                        "Login now",
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
