import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 6,
          child: SizedBox(
            height: 600,
            width: 320,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.userLarge,
                    color: Colors.blue,
                    size: 140,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextfield(
                    label: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    label: 'Passowrd',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'Authenticate',
                    onTap: () {
                      Provider.of<AdminAuthProvider>(context, listen: false)
                          .loginAdmin(emailController.text,
                              passwordController.text, context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
