// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quran_app/model.dart';
import 'package:quran_app/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<asmaul> text = [];
  Repository repository = Repository();

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
                color: Colors.black,
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Asmaul Husna',
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.black,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.greenAccent,
                    child: Text('${text[index].id}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14,
                        )),
                  ),
                  isThreeLine: false,
                  title: Transform(
                    transform: Matrix4.translationValues(-5, -5, 0),
                    child: Text(
                      '${text[index].latin}',
                      style: GoogleFonts.karla(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 1),
                  subtitle: Transform(
                    transform: Matrix4.translationValues(-5, -2, 0),
                    child: Text('${text[index].arti}'),
                  ),
                  trailing: Text(
                    '${text[index].arab}',
                    style: GoogleFonts.amiri(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: text.length,
        ),
      ),
    );
  }
}
