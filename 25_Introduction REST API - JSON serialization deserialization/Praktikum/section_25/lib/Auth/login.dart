import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:section_25/Page/home_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.person), labelText: "Username"),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please Enter Some Text";
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                autofocus: false,
                enableSuggestions: false,
                controller: _passwordController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.key), labelText: "Password"),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please Enter Some Text";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // username : kminchelle
                      // password : 0lelplR

                      final dio = Dio();
                      final Response response = await dio.post(
                        'https://dummyjson.com/auth/login',
                        data: {
                          'username': _usernameController.text,
                          'password': _passwordController.text,
                        },
                        options: Options(
                          headers: {
                            Headers.contentTypeHeader: 'application/json',
                          },
                          validateStatus: (_) => true,
                        ),
                      );
                      log(response.data.toString());

                      if(response.statusCode == 200) {
                        
                        Navigator.of(context).pushAndRemoveUntil(
                            PageRouteBuilder(
                                pageBuilder: (context,animation,secondaryAnimatio) => Dashboard(
                                  firstname : response.data['firstName'].toString(),
                                  lastname : response.data['lastName'].toString(),
                                  image : response.data['image'].toString(),
                                ),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  final tween = Tween(begin: 0.0,end: 1.0);
                                  return FadeTransition(
                                    opacity: animation.drive(tween),
                                    child: child,
                                  );
                                },
                                ),
                            (Route<dynamic> route) => false);
                      } else {
                        final snackBar = SnackBar(
                            content: const Text("Username / Password anda Salah")
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                  child: const Text("Login")),

                  SelectableText(
                    "username : kminchelle\nPassword : 0lelplR"
                  )
            ],
          ),
        ));
  }
}
