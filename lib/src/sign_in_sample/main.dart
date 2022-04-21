import 'package:flutter/material.dart';
import 'export.dart';
import '../../main.dart';

const Color kAccentColor = Color(0xFFFE7C64);
const Color kBackgroundColor = Color(0xFF19283D);
const Color kTextColorPrimary = Color(0xFFECEFF1);
const Color kTextColorSecondary = Color(0xFFB0BEC5);
const Color kButtonColorPrimary = Color(0xFFECEFF1);
const Color kButtonTextColorPrimary = Color(0xFF455A64);
const Color kIconColor = Color(0xFF455A64);

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
      drawer: appNavBar(),
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































