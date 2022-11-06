// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quran_app/model/model.dart';
import 'package:quran_app/repo/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<asmaul> text = [];
  Repository repository = Repository();
  bool isLoading = false;

  getData() async {
    text = await repository.getData();
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
          actions: [
            Transform(
              transform: Matrix4.translationValues(-5, 0, 0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            )
          ],
          elevation: 0,
          backgroundColor: const Color(0xFF672CBC),
          title: Text(
            'Asmaul Husna',
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, index) {
              if (index.connectionState == ConnectionState.done) {
                return AnimationLimiter(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: text.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            child: FlipAnimation(
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Color(0xFF672CBC),
                                    child: Text(
                                      '${text[index].id}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  title: Transform(
                                    transform:
                                        Matrix4.translationValues(0, -5, 0),
                                    child: Text(
                                      '${text[index].latin}',
                                      style: GoogleFonts.karla(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  subtitle: Transform(
                                    transform:
                                        Matrix4.translationValues(0, -3, 0),
                                    child: Text(
                                      '${text[index].arti}',
                                      style: GoogleFonts.karla(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  trailing: Transform(
                                    transform:
                                        Matrix4.translationValues(5, -1, 0),
                                    child: Text(
                                      '${text[index].arab}',
                                      style: GoogleFonts.amiri(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  dense: true,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              } else if (index.connectionState == ConnectionState.waiting) {
                return Center(
                    child: LoadingAnimationWidget.fallingDot(
                        color: Colors.purple, size: 50));
              } else if (index == 'Failed host lookup') {
                return Center(
                    child: LoadingAnimationWidget.fallingDot(
                        color: Colors.yellowAccent, size: 50));
              } else {
                return const Text('Check Your Connection Again');
              }
            }));
  }
}
