import 'package:flutter/material.dart';
import '../../services/auth_provider.dart';
//import 'app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.title = 'Login'});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final authService = AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                onChanged: (String value) {
                  username = value;
                },
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                onChanged: (String value) {
                  password = value;
                },
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                  final enteredUsername = _usernameController.text;
                  final enteredPassword = _passwordController.text;
                  // You can use enteredUsername and enteredPassword as needed
                  authService.signUp(enteredUsername, enteredPassword);
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}