import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../widgets/confirm_exit_app.dart';
import '../providers/auth.dart';
import '../model/http_exception.dart';
import '../screens/products_overview_screen.dart';
import '../widgets/error/dialog_error.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const routeName = '/auth2';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final storage = const FlutterSecureStorage();

  final _passwordController = TextEditingController();

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Future _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      throw HttpException("Incorrect inputs!");
    }
    _formKey.currentState!.save();

    // Log user in
    final signInStatus = await Provider.of<Auth>(context, listen: false).signIn(
      _authData['email'].toString(),
      _authData['password'].toString(),
    );
    if (signInStatus) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ConfirmExit(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: screenSize.width,
              height: screenSize.height,
              child: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: screenSize.height * .80,
                              width: screenSize.width * 0.80,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(80),
                                      child: Text(
                                        "SIGN IN",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                    Text(
                                      "Email address",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.3,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "juandelacruz@email.com"),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !value.contains('@')) {
                                            throw HttpException(
                                                'Invalid email!');
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _authData['email'] = value.toString();
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "Password",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.3,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: 'Password'),
                                        obscureText: true,
                                        controller: _passwordController,
                                        autofocus: false,
                                        onSaved: (value) {
                                          _authData['password'] =
                                              value.toString();
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: SizedBox(
                                        width: screenSize.width * 0.3,
                                        height: 60,
                                        child: OutlinedButton(
                                          style: OutlinedButtonTheme.of(context)
                                              .style,
                                          onPressed: () async {
                                            try {
                                              final status = await _submit();
                                              if (status) {
                                                if (!mounted) return;
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        const ProductsOverviewScreen(),
                                                  ),
                                                );
                                              } else {
                                                throw HttpException(
                                                    "Could not sign you in at this time. Please try again later.");
                                              }
                                            } on TimeoutException catch (_) {
                                              ErrorDialog().showDialog1(context,
                                                  "Request timed out. Please try again!");
                                            } catch (error) {
                                              ErrorDialog().showDialog1(
                                                context,
                                                error.toString(),
                                              );
                                            }
                                          },
                                          child: Text(
                                            "Login",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Don't have an account? Contact our team to sign up!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 270,
                    bottom: screenSize.height * 0.25,
                    child: Image.asset("assets/images/valo.png"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
