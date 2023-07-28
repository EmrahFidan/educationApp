import 'package:education/recurring/colors.dart';
import 'package:flutter/material.dart';

class RankedPage extends StatefulWidget {
  const RankedPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RankedPageState createState() => _RankedPageState();
}

class _RankedPageState extends State<RankedPage> {
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
          'Sıralamanız',
          style: TextStyle(
            fontSize: fontSize * 3,
            fontStyle: FontStyle.italic,
            color: Color(0xFFCCC9DC),
          ),
        ),
        toolbarHeight: 70 * specialSize,
        backgroundColor: ColorVariations.primaryColor,
      ),
      backgroundColor: ColorVariations.secondaryColor,
      // Yukarıdaki satırda ekranın arka plan rengini tema ayarlarına göre ayarlıyoruz
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: space,
          vertical: space,
        ),
        child: Center(
          child: Text(
            'Burada diğer kullanıcılar arasındaki sıralamanızı görebilirsiniz',
            style: TextStyle(
                fontSize: fontSize * 3, color: ColorVariations.textColor),
          ),
        ),
      ),
    );
  }
}
