import 'package:fire_app/services/auth.dart';
import 'package:fire_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fire_app/shared/contant.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  const SignIn({required this.toggle, super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    //text field state
    String email = '';
    String password = '';
    String error = '';
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: const Text('Sign in to Brew Crew'),
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
                      'Register',
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
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        showCursor: true,
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
                        showCursor: true,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                        keyboardType: TextInputType.visiblePassword,
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
                            setState(() => loading = true);

                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);

                            //String theResult = result.toString();
                            if (result == null) {
                              setState(() {
                                error = "Something went wrong";
                                loading = false;
                              });
                            }

                            print(error);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Sign in',
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
