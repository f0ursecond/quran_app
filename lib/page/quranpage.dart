import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quran_app/model/quranmodel.dart';
import 'package:quran_app/repo/quranrepo.dart';
import 'dart:convert';

class quranPage extends StatefulWidget {
  const quranPage({super.key});

  @override
  State<quranPage> createState() => _quranPageState();
}

class _quranPageState extends State<quranPage> {
  List<quran> anjay = [];
  Repository quranrepo = Repository();

  getData() async {
    anjay = await quranrepo.getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF672CBC),
        actions: [
          Transform(
              transform: Matrix4.translationValues(-6, 0, 0),
              child: Icon(Icons.search)),
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, index) {
          if (index.connectionState == ConnectionState.done) {
            return Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  margin: EdgeInsets.only(top: 20),
                  width: 220,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Al Qur\'an',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: anjay.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            child: FlipAnimation(
                              child: Card(
                                color: Colors.white,
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(5),
                                  leading: Transform(
                                    transform:
                                        Matrix4.translationValues(2, 0, 0),
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor: const Color(0xFF672CBC),
                                      child: Text(
                                        '${anjay[index].nomor}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Transform(
                                    transform:
                                        Matrix4.translationValues(4, -2, 0),
                                    child: Text(
                                      '${anjay[index].nama_latin}',
                                      style: GoogleFonts.outfit(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  subtitle: Transform(
                                      transform:
                                          Matrix4.translationValues(4, 0, 0),
                                      child: RichText(
                                        text: TextSpan(
                                          text:
                                              '${anjay[index].tempat_turun.toUpperCase()}',
                                          style: GoogleFonts.karla(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                          ),
                                          children: [
                                            const TextSpan(
                                              text: ' • ',
                                            ),
                                            TextSpan(
                                                text:
                                                    '${anjay[index].arti.toUpperCase()}'),
                                          ],
                                        ),
                                      )),
                                  dense: true,
                                  trailing: Transform(
                                    transform:
                                        Matrix4.translationValues(-4, 2, 0),
                                    child: Text(
                                      '${anjay[index].nama}',
                                      style: GoogleFonts.amiri(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF672CBC),
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.fallingDot(
                  color: Colors.purple, size: 50),
            );
          }
        },
      ),
    );
  }
}
