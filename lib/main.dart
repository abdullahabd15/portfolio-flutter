import 'package:ab_solution_portfolio/pages/main/main_page.dart';
import 'package:ab_solution_portfolio/providers/inview_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abdullah - Portfolio',
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3A3A3A),
          primary: const Color(0xFF3A3A3A),
          primaryContainer: const Color(0xFF3A3A3A),
        ),
        dividerTheme: DividerThemeData(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          thickness: 0.5,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3A3A3A),
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 42),
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => InViewProvider()),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;
            return MainPage(isMobile: isMobile);
          },
        ),
      ),
    );
  }
}
