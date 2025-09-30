import 'package:flutter/material.dart';
import 'package:template_quiz_mobile_si_b/ui/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = " ";
  String password = " ";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 200),
                const SizedBox(height: 40),
                Text(
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
                  "Selamat datang, Silahkan Login",
                ),
                const SizedBox(height: 10),
                _usernameField(),
                _passwordField(),
                _loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
          hint: Text('Enter your username'),
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          hint: Text('Enter your password'),
          prefixIcon: Icon(Icons.lock),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: (isLoginSuccess) ? Colors.deepOrange : Colors.red,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          String text = " ";
          if (username == "kiel" && password == "087") {
            setState(() {
              text = "Login Berhasil";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage(username: username);
                },
              ),
            );
          } else {
            setState(() {
              text = "Login Gagal";
              isLoginSuccess = false;
            });
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(text),
              backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
            ),
          );
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Login'),
      ),
    );
  }
}
