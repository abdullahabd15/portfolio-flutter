import 'package:ab_solution_portfolio/data/singleton.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Text(
            '© 2024 Abdullah, Build with Flutter.',
            style: TextStyle(color: SingletonData.colorAmber),
          ),
        ),
      ),
    );
  }
}
