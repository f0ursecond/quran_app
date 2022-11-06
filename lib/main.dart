import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/page/choose.dart';
import 'package:quran_app/page/home.dart';
import 'package:quran_app/page/loginpage.dart';
import 'package:quran_app/page/quranpage.dart';
import 'package:quran_app/page/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
      );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) =>
                const HomePage(),
          ),
          GoRoute(
            path: 'quran',
            builder: (BuildContext context, GoRouterState state) =>
                const quranPage(),
          ),
          GoRoute(
            path: 'choose',
            builder: (BuildContext context, GoRouterState state) =>
                const Choose(),
          ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const splash(),
      ),
    ],
  );
}
