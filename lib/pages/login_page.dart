import 'package:flutter/material.dart';
import 'package:my_shop/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // const LoginPage({Key? key}) : super(key: key);
  String data = "";
  bool changeBtn = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.theme.canvasColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/images/loginImg.png",
                fit: BoxFit.cover,
                height: 300,
              ),
              Text(
                "Welcome to MyShop",
                style: TextStyle(fontSize: 30, color: context.theme.cardColor),
              ).p16(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username can not be none ";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "UserName", labelText: "Enter Username "),
                        onChanged: (value) {
                          setState(() {
                            data = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username can not be none ";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Password", labelText: "Enter Password "),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Material(
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                changeBtn = true;
                              });
                              await Future.delayed(const Duration(seconds: 1));
                              await Navigator.pushNamed(
                                  context, MyRoutes.homeRoute);
                              setState(() {
                                changeBtn = false;
                              });
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: 50,
                            width: changeBtn ? 60 : 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: context.theme.cardColor,
                              borderRadius:
                                  BorderRadius.circular(changeBtn ? 30 : 8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: changeBtn
                                ? Icon(
                                    Icons.done,
                                    color: context.theme.canvasColor,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Created by : Rajat Dhiman",
                        // ignore: deprecated_member_use
                        style: TextStyle(color: context.theme.cardColor),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
