import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/main.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late final Timer _timer;
  Timer? _verificationTimer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && user.emailVerified) {
        UliveryApp.fadeHome();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    if (_verificationTimer != null) {
      _verificationTimer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset("assets/img/login/verify_email.png"),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text("Verifieer je e-mailadres",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Theme.of(context).colorScheme.primary)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Om gebruik te kunnen maken van de applicatie moet je e-mailadres nog geverifieerd worden. Ga naar je inbox en klik op de verificatielink. Geen bericht in je inbox? Check dan ook even je spam-folder.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  _verificationTimer != null
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Niks ontvangen? "),
                            GestureDetector(
                              onTap: () async {
                                User? user = FirebaseAuth.instance.currentUser;
                                if (user != null && !user.emailVerified) {
                                  await user.sendEmailVerification();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text("Verificatie e-mail verzonden!")));
                                  setState(() {
                                    _verificationTimer = Timer(const Duration(seconds: 30), () {
                                      setState(() {
                                        _verificationTimer = null;
                                      });
                                    });
                                  });
                                }
                              },
                              child: Text("Opnieuw versturen",
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
