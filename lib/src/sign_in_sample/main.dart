import 'package:flutter/material.dart';
import 'organisms/header.dart';
import 'organisms/sign_in_form.dart';
import 'organisms/footer.dart';
import 'util/color.dart';

class LogInUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sign In or Up demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(secondary: kAccentColor),
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(
      //   title: 'Login',
      // ),
      //drawer: appNavBar(),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //header,form,footerの配置
              Header(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SignInForm(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 64),
                child: Footer(),
              )
            ],
          ),
        ),
      ),
    );
  }
}































