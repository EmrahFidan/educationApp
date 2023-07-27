import 'package:education/recurring/colors.dart';
import 'package:flutter/material.dart';

class RankedPage extends StatelessWidget {
  const RankedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sıralamanız',
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            color: Color(0xFFCCC9DC),
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: ColorVariations.primaryColor,
      ),
      backgroundColor: ColorVariations.secondaryColor,
      // Yukarıdaki satırda ekranın arka plan rengini tema ayarlarına göre ayarlıyoruz
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Center(
          child: Text(
            'Burada diğer kullanıcılar arasındaki sıralamanızı görebilirsiniz',
            style: TextStyle(fontSize: 24),
            selectionColor: Colors.white54,
          ),
        ),
      ),
    );
  }
}
