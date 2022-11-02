import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool obsecureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF863ED5),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AL-QURAN',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                      ),
                      Container(
                        height: 280,
                        width: 280,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 32.0),
                          child: Lottie.asset('assets/animations/quran.json'),
                        ),
                      ),
                    ],
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 11.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Login here ...',
                              style: GoogleFonts.hind(
                                letterSpacing: 1,
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Please enter your email & password',
                              style: GoogleFonts.hind(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Textfield Nis
                const SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // validator: validateEmail,
                    // controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 5, 5), width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Ionicons.mail_open_outline,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // TextField Password

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // validator: validatePassword,
                    // controller: _passcontroller,
                    obscureText: obsecureText,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 5, 5), width: 2.0),
                      ),
                      suffixIcon: Transform(
                        transform: Matrix4.translationValues(-5, 0, 0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              obsecureText = !obsecureText;
                            });
                          },
                          icon: obsecureText
                              ? const Icon(
                                  Feather.eye_off,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Feather.eye,
                                  color: Colors.black,
                                ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: 'Password',
                      prefixIcon: const Icon(
                        Feather.lock,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, left: 10.0, bottom: 10.0, top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
