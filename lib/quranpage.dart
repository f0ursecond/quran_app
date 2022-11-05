import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/quranmodel.dart';
import 'package:quran_app/quranrepo.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 141, 65, 248),
                      borderRadius: BorderRadius.circular(10)),
                  width: 390,
                  height: 120,
                  child: Transform(
                    transform: Matrix4.translationValues(-80, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Text(
                            'ٱلسَّلَامُ عَلَيْكُمْ وَرَحْمَةُ ٱللَّٰهِ وَبَرَكَاتُهُ',
                            style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 100),
                          child: Column(
                            children: const [
                              Divider(
                                color: Color.fromARGB(255, 233, 229, 229),
                                thickness: 1,
                              ),
                              Text('Minggu, 12 Juni 2019')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: anjay.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        child: FlipAnimation(
                          child: Card(
                            color: Colors.grey[300],
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 16,
                                backgroundColor: Color(0xFF672CBC),
                                child: Text(
                                  '${anjay[index].nomor}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: Transform(
                                transform: Matrix4.translationValues(4, -2, 0),
                                child: Text(
                                  '${anjay[index].nama_latin}',
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              subtitle: Transform(
                                transform: Matrix4.translationValues(4, 0, 0),
                                child: Text(
                                  '${anjay[index].arti}',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              dense: true,
                              trailing: Transform(
                                transform: Matrix4.translationValues(4, -3, 0),
                                child: Text(
                                  '${anjay[index].nama}',
                                  style: GoogleFonts.amiri(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
