import 'package:education/recurring/colors.dart';
import 'package:education/screens/login/logIn_page.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  Widget buildInputContainer(String hintText, bordercolor) {
    double space = 30;

    double inputWidth = 350; // 350
    double inputHeight = 50; // 50

    return Container(
      width: inputWidth,
      height: inputHeight,
      padding: EdgeInsets.only(left: space * 2 / 3),
      decoration: BoxDecoration(
        color: ColorVariations.primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: bordercolor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(color: ColorVariations.textColor),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: ColorVariations.transparentTextColor,
                  fontSize: 15,
                ), // Güncellendi
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUpdateButton(BuildContext context) {
    return Container(
      width: 160,
      height: 40,
      decoration: BoxDecoration(
        color: ColorVariations.updateButtonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () {
          // Giriş yap butonuna tıklanınca yeni sayfa açılıyor
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage2()),
          );
        },
        child: const Text(
          "Şifremi güncelle",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 14,
            color: ColorVariations.textColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Şifremi değiştir',
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            color: Color(0xFFCCC9DC),
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: ColorVariations.secondaryColor,
      ),
      backgroundColor: ColorVariations.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Add 3 text fields here
            buildInputContainer(
                "Eski Şifrenizi giriniz", ColorVariations.falseColor),
            const SizedBox(height: 30),
            buildInputContainer(
                "Yeni Şifrenizi giriniz", ColorVariations.trueColor),
            const SizedBox(height: 60),
            buildUpdateButton(context),
            const SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                // Link'e tıklanınca ?
              },
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "Eski şifrenizi mi unuttunuz ? ",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorVariations.transparentTextColor,
                    decoration: TextDecoration
                        .underline, // Metni altı çizili yaparak bir bağlantı gibi gösteriyoruz.
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
