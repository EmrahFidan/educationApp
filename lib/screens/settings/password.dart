import 'package:education/recurring/colors.dart';
import 'package:education/screens/login/logIn_page.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  double get specialSizeWidth => MediaQuery.of(context).size.width / 100;
  double get specialSizeHeight => MediaQuery.of(context).size.height / 100;
  static const double specialSize = 1;
  static const double fontSize = 15;
  static const double space = 20;

  Widget buildInputContainer(String hintText, bordercolor) {
    double inputWidth = 89.12 * specialSizeWidth;
    double inputHeight = 6.2217 * specialSizeHeight;

    return Container(
      width: inputWidth,
      height: inputHeight,
      padding: const EdgeInsets.only(left: space),
      decoration: BoxDecoration(
        color: ColorVariations.primaryColor,
        borderRadius: BorderRadius.circular(space),
        border: Border.all(
          width: specialSize,
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
                  fontSize: fontSize,
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
    double updateWidth = 40.74 * specialSizeWidth;
    double updateHeight = 4.97 * specialSizeHeight;
    return Container(
      width: updateWidth,
      height: updateHeight,
      decoration: BoxDecoration(
        color: ColorVariations.updateButtonColor,
        borderRadius: BorderRadius.circular(space),
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
            fontSize: fontSize - 1,
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
            fontSize: (fontSize / 5) * 8,
            fontStyle: FontStyle.italic,
            color: Color(0xFFCCC9DC),
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: ColorVariations.secondaryColor,
      ),
      backgroundColor: ColorVariations.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: space * 4, vertical: space * 2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: space * 3),
              // Add 3 text fields here
              buildInputContainer(
                  "Eski Şifrenizi giriniz", ColorVariations.falseColor),
              const SizedBox(height: space * 2),
              buildInputContainer(
                  "Yeni Şifrenizi giriniz", ColorVariations.trueColor),
              const SizedBox(height: space * 3),
              buildUpdateButton(context),
              const SizedBox(height: space * 3),
              GestureDetector(
                onTap: () {
                  // Link'e tıklanınca ?
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Eski şifrenizi mi unuttunuz ? ",
                    style: TextStyle(
                      fontSize: fontSize - 1,
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
      ),
    );
  }
}
