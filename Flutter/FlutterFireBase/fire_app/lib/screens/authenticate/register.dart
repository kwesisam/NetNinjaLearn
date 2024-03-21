import 'package:fire_app/services/auth.dart';
import 'package:fire_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fire_app/shared/contant.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({required this.toggle, super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    String error = "";

    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: const Text('Sign up to Brew Crew'),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      widget.toggle();
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            body: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter an email';
                          }

                          return null;
                        },
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        autocorrect: false,
                        enableSuggestions: false,
                        validator: (val) {
                          if (val!.length < 6) {
                            return 'Enter a password 6+ characters long';
                          }

                          return null;
                        },
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.pinkAccent),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            var result = await _auth
                                .registerWithEmailAndPassword(email, password);

                            print('checking result');
                            print(result);
                            //String theResult = result.toString();
                            if (result == null) {
                              setState(() => error = "Something went wrong");
                            } else {
                              setState(() {
                                error = "hemmmm";
                                loading = false;
                              });
                            }
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        error,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      )
                    ],
                  ),
                )),
          );
  }
}
