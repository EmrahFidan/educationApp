import 'package:education/recurring/colors.dart';
import 'package:flutter/material.dart';

class HowToPlayPage extends StatefulWidget {
  const HowToPlayPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HTPPState createState() => _HTPPState();
}

class _HTPPState extends State<HowToPlayPage> {
  double get specialSizeWidth => MediaQuery.of(context).size.width / 100;
  double get specialSizeHeight => MediaQuery.of(context).size.height / 100;
  static const double specialSize = 1;
  static const double fontSize = 8;
  static const double space = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Nasıl Oynanır ?',
          style: TextStyle(
            fontSize: fontSize * 3,
            fontStyle: FontStyle.italic,
            color: ColorVariations.textColor,
          ),
        ),
        toolbarHeight: 70 * specialSize,
        backgroundColor: ColorVariations.secondaryColor,
      ),
      backgroundColor: ColorVariations.primaryColor,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: space, vertical: space),
        child: Center(
          child: Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Biz de daha bilmiyoruz",
                style: TextStyle(
                  fontSize: fontSize * 3,
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
