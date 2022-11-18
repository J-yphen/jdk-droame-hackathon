import 'package:flutter/material.dart';
import 'package:jdk_flutter/pages/login.dart';
import 'package:jdk_flutter/pages/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
 
  bool showLogin = true;
  void toggleScreens(){
    setState(() {
      showLogin = !showLogin;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if(showLogin){
      return LoginPage(showRegisterPage: toggleScreens,);
    }
    else{
      return RegisterPage(showLoginPage: toggleScreens,);
    }

  }
}