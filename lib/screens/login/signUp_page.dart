// ignore_for_file: file_names

import 'package:education/screens/login/logIn_page.dart';
import 'package:flutter/material.dart';
import 'package:education/recurring/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  double get specialSizeWidth => MediaQuery.of(context).size.width / 100;
  double get specialSizeHeight => MediaQuery.of(context).size.height / 100;

  static const double specialSize = 1;
  static const double borderWidth = 0.5;
  static const double borderRadiusValue = 76;
  static const double fontSize = 15;
  static const double iconSize = 5;

  @override
  Widget build(BuildContext context) {
    double space = 3.7330 * specialSizeHeight;

    return Scaffold(
      backgroundColor: ColorVariations.primaryColor,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              spaceHeight(space * 4),
              const Text(
                'Kayıt Ol',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: fontSize * 2,
                  color: ColorVariations.borderColor,
                ),
              ),
              spaceHeight(space),
              buildContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer() {
    double space = 3.7330 * specialSizeHeight;
    double bottomScreenSetting = 21.70 *
        specialSizeHeight; // responsive tasarımda hata çıkarsa buradan kaynaklıdır

    var panelWidth = specialSizeWidth * 100 >= 600
        ? specialSizeWidth * 60
        : specialSizeWidth * 100;

    return Container(
      width: panelWidth,
      height: specialSizeHeight * 100 - bottomScreenSetting,
      decoration: BoxDecoration(
        color: ColorVariations.secondaryColor,
        border: Border.all(
          width: borderWidth,
          color: ColorVariations.borderColor,
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(borderRadiusValue),
          topLeft: Radius.circular(borderRadiusValue),
        ),
      ),
      padding: const EdgeInsets.all(specialSize * 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildPhotoButton(),
          spaceHeight(space / 15 * 4),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Fotoğraf Ekle",
              style: TextStyle(
                fontSize: fontSize / 5 * 4,
                color: ColorVariations.transparentTextColor,
              ),
            ),
          ),
          spaceHeight(space),
          buildInputContainer(
            hintText: 'Adınız',
          ),
          spaceHeight(space),
          buildInputContainer(
            hintText: 'Soyadınız',
          ),
          spaceHeight(space),
          buildInputContainer(
            hintText: 'E-mail',
          ),
          spaceHeight(space),
          buildPasswordContainer(),
          spaceHeight(space * 1.5),
          Row(
            children: [
              Expanded(
                child: signInButton(context),
              ),
              spaceWidth(space * 2.5),
              Expanded(
                child: logInButton(context),
              ),
            ],
          ),
          spaceHeight(space),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Kayıtlı bir hesabınız varsa giriş yap butonuna tıklayınız ",
              style: TextStyle(
                fontSize: fontSize,
                color: ColorVariations.transparentTextColor,
              ),
              textAlign: TextAlign.center, // Metni yatayda merkezlemek için
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPhotoButton() {
    double photoButton = 7.4660 * specialSizeHeight;
    return Align(
      alignment: Alignment.topCenter,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25 * specialSize),
          ),
          backgroundColor: ColorVariations.primaryColor,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          // Butona tıklanıldığında yapılacak işlemler buraya gelebilir
        },
        child: Ink(
          width: photoButton,
          height: photoButton,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25 * specialSize),
          ),
          child: const Icon(
            Icons.add_a_photo,
            size: 5 * iconSize,
            color: ColorVariations.transparentTextColor,
          ),
        ),
      ),
    );
  }

  Widget buildInputContainer({required String hintText}) {
    double inputWidth = 89.12 * specialSizeWidth; // 350
    double inputHeight = 6.22 * specialSizeHeight; // 50

    return Container(
      width: inputWidth,
      height: inputHeight,
      padding: const EdgeInsets.only(left: 20 * specialSize),
      decoration: BoxDecoration(
        color: ColorVariations.primaryColor,
        borderRadius: BorderRadius.circular(20 * specialSize),
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

  Widget buildPasswordContainer() {
    double inputWidth = 89.12 * specialSizeWidth; // 350
    double inputHeight = 6.22 * specialSizeHeight; // 50

    return Row(
      children: [
        Expanded(
          child: Container(
            width: inputWidth,
            height: inputHeight,
            padding: const EdgeInsets.only(
                left: 20 * specialSize, right: 10 * specialSize),
            decoration: BoxDecoration(
              color: ColorVariations.primaryColor,
              borderRadius: BorderRadius.circular(20 * specialSize),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: passwordController,
                    style: const TextStyle(color: ColorVariations.textColor),
                    obscureText: !isPasswordVisible,
                    decoration: const InputDecoration(
                      hintText: 'Şifre',
                      hintStyle: TextStyle(
                        color: ColorVariations.transparentTextColor,
                        fontSize: fontSize,
                      ),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    size: iconSize * 4,
                    color: ColorVariations.transparentTextColor,
                  ),
                  onPressed: togglePasswordVisibility,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget signInButton(BuildContext context) {
    double buttonwidth = 38.194 * specialSizeWidth; // 150
    double buttonHeight = 4.97 * specialSizeHeight;

    return SizedBox(
      width: buttonwidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () {
          // Butona tıklanıldığında yapılacak işlemler buraya gelebilir
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: ColorVariations.transparentTextColor,
          backgroundColor: ColorVariations.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30 * specialSize),
            side: const BorderSide(
              width: 2 * specialSize,
              color: ColorVariations.borderColor,
            ),
          ),
        ),
        child: const Center(
          child: Text(
            "Kayıt Ol",
            style: TextStyle(
              fontSize: fontSize,
              fontStyle: FontStyle.italic,
              color: ColorVariations.textColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget logInButton(BuildContext context) {
    double buttonwidth = 25.463 * specialSizeWidth;
    double buttonHeight = 4.97 * specialSizeHeight;

    return SizedBox(
      width: buttonwidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () {
          // Giriş yap butonuna tıklanınca yeni sayfa açılıyor
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage2()),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: ColorVariations.transparentTextColor,
          backgroundColor: ColorVariations.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30 * specialSize),
            side: const BorderSide(
              width: 2 * specialSize,
              color: ColorVariations.borderColor,
            ),
          ),
        ),
        child: const Center(
          child: Text(
            "Giriş Yap",
            style: TextStyle(
              fontSize: fontSize,
              fontStyle: FontStyle.italic,
              color: ColorVariations.textColor,
            ),
          ),
        ),
      ),
    );
  }
}

Widget spaceHeight(double height) => SizedBox(height: height);
Widget spaceWidth(double width) => SizedBox(width: width);
