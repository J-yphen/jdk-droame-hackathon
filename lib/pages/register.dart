import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _mail = TextEditingController();
  final _pass = TextEditingController();
  final _confPass = TextEditingController();

  @override
  void dispose() {
    _mail.dispose();
    _pass.dispose();
    _confPass.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _mail.text.trim(),
        password: _pass.text.trim(),
      );
    }
  }

  bool passwordConfirmed(){
    if(_pass.text.trim() == _confPass.text.trim()){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 105, 233, 242),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SIGN UP',
                style: GoogleFonts.roadRage(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),

              Text(
                'to begin sharing!',
                style: GoogleFonts.rubik(
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 40),

              // Email field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: _mail,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: Colors.white, width: 5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.amber, width: 5),
                    ),
                    hintText: 'Email',
                    fillColor: Color.fromARGB(255, 250, 250, 250),
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 10),

              // Password field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  obscureText: true,
                  controller: _pass,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: Colors.white, width: 5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.amber, width: 5),
                    ),
                    hintText: 'Password',
                    fillColor: Color.fromARGB(255, 250, 250, 250),
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 10),

              // Confirm password field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  obscureText: true,
                  controller: _confPass,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: Colors.white, width: 5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.amber, width: 5),
                    ),
                    hintText: 'Confirm Password',
                    fillColor: Color.fromARGB(255, 250, 250, 250),
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Sign In Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Register Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Already a user?'),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      ' Sign in!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
