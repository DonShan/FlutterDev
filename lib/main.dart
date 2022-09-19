import 'package:flutter/material.dart';
import 'package:loginview/user_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isBgChange = false;

  @override
  Widget build(BuildContext context) {
    //View Model Instance
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:
            isBgChange ? Color.fromARGB(255, 39, 104, 173) : Colors.amberAccent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Image.asset(
                  "assets/profileImage.png",
                  width: 100,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Colors.white24)

                          //borderSide: const BorderSide(),
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "WorkSansLight",
                      ),
                      filled: true,
                      hintText: 'Email'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0)
                          //borderSide: const BorderSide(),
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.white, fontFamily: "WorkSansLight"),
                      filled: true,
                      hintText: 'Password'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isBgChange = !isBgChange;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 60,
                      child: const Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Cannot access your account?",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
