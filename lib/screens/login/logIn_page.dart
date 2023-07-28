// ignore_for_file: file_names

import 'package:education/recurring/colors.dart';
import 'package:flutter/material.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
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
  static const double iconSize = 20;

  @override
  Widget build(BuildContext context) {
    double space = 3.7330 * specialSizeHeight;

    final mediaQuery = MediaQuery.of(context);
    final containerHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: ColorVariations.primaryColor,
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildContainerEmpty(),
              spaceHeight(space * 7),
              const Text(
                'Giriş Yap',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: fontSize * 2,
                  color: ColorVariations.borderColor,
                ),
              ),
              spaceHeight(space),
              buildContainer(
                containerHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(double height) {
    double space = 3.7330 * specialSizeHeight;

    var panelWidth = specialSizeWidth * 100 >= 600
        ? specialSizeWidth * 60
        : specialSizeWidth * 100;
    return Container(
      width: panelWidth,
      height: height,
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
      padding: EdgeInsets.all(space),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          spaceHeight(space),
          buildInputContainer(
            hintText: 'E-mail',
          ),
          spaceHeight(space),
          buildPasswordContainer(),
          spaceHeight(space * 2),
          logInButton(context),
          spaceHeight(space * 2 / 3),
          GestureDetector(
            onTap: () {
              // Link'e tıklanınca ?
            },
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                "Şifrenizi mi unuttunuz ?",
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
    );
  }

  Widget buildContainerEmpty() {
    double heightTopContainer = 12.4434 * specialSizeHeight;

    var panelWidth = specialSizeWidth * 100 >= 600
        ? specialSizeWidth * 60
        : specialSizeWidth * 100;
    return Container(
      width: panelWidth,
      height: heightTopContainer,
      decoration: BoxDecoration(
        color: ColorVariations.secondaryColor,
        border: Border.all(
          width: borderWidth,
          color: ColorVariations.borderColor,
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(borderRadiusValue),
          bottomLeft: Radius.circular(borderRadiusValue),
        ),
      ),
    );
  }

  Widget buildInputContainer({required String hintText}) {
    double space = 3.7330 * specialSizeHeight;

    double inputWidth = 89.12 * specialSizeWidth; // 350
    double inputHeight = 6.22 * specialSizeHeight; // 50

    return Container(
      width: inputWidth,
      height: inputHeight,
      padding: EdgeInsets.only(left: space * 2 / 3),
      decoration: BoxDecoration(
        color: ColorVariations.primaryColor,
        borderRadius: BorderRadius.circular(specialSize * 20),
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
    double space = 3.7330 * specialSizeHeight;
    double inputWidth = 89.12 * specialSizeWidth; // 350
    double inputHeight = 6.22 * specialSizeHeight; // 50

    return Row(
      children: [
        Expanded(
          child: Container(
            width: inputWidth,
            height: inputHeight,
            padding: EdgeInsets.only(left: space * 2 / 3, right: space * 1 / 3),
            decoration: BoxDecoration(
              color: ColorVariations.primaryColor,
              borderRadius: BorderRadius.circular(specialSize * 20),
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
                    size: iconSize,
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

  Widget logInButton(BuildContext context) {
    double buttonwidth = 25.4629 * specialSizeWidth;
    double buttonHeight = 4.97 * specialSizeHeight; // 40

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: specialSize * 100),
      child: SizedBox(
        width: buttonwidth,
        height: buttonHeight,
        child: ElevatedButton(
          onPressed: () {
            // butona tıklayınca
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: ColorVariations.textColor,
            backgroundColor: ColorVariations.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(specialSize * 30),
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
      ),
    );
  }
}

Widget spaceHeight(double height) => SizedBox(height: height);
