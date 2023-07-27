import 'package:education/recurring/colors.dart';
import 'package:flutter/material.dart';

class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Nasıl Oynanır ?',
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            color: ColorVariations.textColor,
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: ColorVariations.secondaryColor,
      ),
      backgroundColor: ColorVariations.primaryColor,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Center(
          child: Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Biz de daha bilmiyoruz",
                style: TextStyle(
                  fontSize: 24,
                  color: ColorVariations.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
