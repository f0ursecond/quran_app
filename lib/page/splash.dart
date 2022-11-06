import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/page/home.dart';
import 'package:quran_app/page/loginpage.dart';
import 'package:quran_app/page/quranpage.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 86),
              child: Column(
                children: [
                  Text(
                    'Quran App',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF672CBC),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '     Learn Quran and \n Recite once everyday',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 360,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF672CBC),
                    ),
                    child: Transform(
                      transform: Matrix4.translationValues(1, -43, 0),
                      child: Image.asset(
                        'assets/images/logo2.png',
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(0, -28, 0),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFFF9B091),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => context.go('/choose'),
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.white,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
