import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _passVisibility = true;

    void showPassword() {
      setState(() {
        _passVisibility = true;
        print(_passVisibility);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      label: Text('Username'),
                      hintText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: _passVisibility
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: showPassword,
                      ),
                    ),
                    obscureText: _passVisibility,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
