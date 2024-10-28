// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/page/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // functions
  void doLogin() {
    // call authentication

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.fingerprint_rounded,
              size: 150,
              color: Theme.of(context).colorScheme.primary,
            ),

            // message app slogan
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                AppLocalizations.of(context)!.loginSlogan,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),

            // email

            // password

            // button
            Padding(
              padding: const EdgeInsets.all(30),
              child: GestureDetector(
                onTap: doLogin,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 70, right: 70, top: 10, bottom: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "L O G I N", //TODO: add to arb
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
