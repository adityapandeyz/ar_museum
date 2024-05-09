import 'package:ar_museum/maps/ar_earth_map_screen.dart';
import 'package:ar_museum/provider/fire_provider.dart';
import 'package:ar_museum/provider/google_sign_in_provider.dart';

import 'package:ar_museum/firebase_options.dart';
import 'package:ar_museum/screens/error_screen.dart';
import 'package:ar_museum/screens/sign_in_with_email_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/servdartices.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'provider/auth_provider.';
import 'screens/google_sign_in_screen.dart';
import 'screens/home_screen.dart';
import 'utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdminAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FireProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          primaryColor: primaryColor,
          textTheme: TextTheme(
            bodyText1: GoogleFonts.getFont('Montserrat'),
            bodyText2: GoogleFonts.getFont('Montserrat'),
            caption: GoogleFonts.getFont('Montserrat'),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(255, 0, 0, 0),
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            ),
            elevation: 0,
            centerTitle: false,
            // color: secondaryColor,
            titleTextStyle: GoogleFonts.getFont(
              'Montserrat',
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const HomeScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: ErrorScreen(
                  locatin: snapshot.error.toString(),
                ),
              );
            }
            return const LoginPage();
          },
        ),
      ),
    );
  }
}
