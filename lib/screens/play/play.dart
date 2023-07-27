// ignore_for_file: file_names

import 'package:education/recurring/colors.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool isMessageOpen =
      false; // Alert message alanının açık olup olmadığını tutacak değişken

  double get specialSizeWidth => MediaQuery.of(context).size.width / 100;
  double get specialSizeHeight => MediaQuery.of(context).size.height / 100;

  static const double specialSize = 1;
  static const double borderWidth = 0.5;
  static const double paddingSize = 30;
  static const double borderRadiusValue = 76;
  static const double fontSize = 15;
  static const double iconSize = 25;

  @override
  Widget build(BuildContext context) {
    double space = 2.48 * specialSizeHeight;

    return Scaffold(
      backgroundColor: ColorVariations.primaryColor,
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            buildContainerEmpty(),
            spaceHeight(space),
            buildVideoContainer(),
            spaceHeight(space),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                circleButton(context, Icons.restart_alt),
                spaceWidth(space * 1.5),
                circleButton(context, Icons.favorite_border_outlined),
                spaceWidth(space * 3),
                logInButton(context),
              ],
            ),
            spaceHeight(space),
            buildContainer(
              specialSizeHeight * 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(double height) {
    double space = 2.48 * specialSizeHeight; // 20
    double bottomScreenSetting = 56 * specialSizeHeight; // 450

    var panelWidth = specialSizeWidth * 100 >= 600
        ? specialSizeWidth * 60
        : specialSizeWidth * 100;
    return Container(
      width: panelWidth,
      height: height - bottomScreenSetting,
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
      padding: const EdgeInsets.all(paddingSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          spaceHeight(space * 1),
          buildInputContainer(
            'A ) ', // hintText parametresi bu şekilde verilmelidir
          ),
          spaceHeight(space),
          buildInputContainerTrue(
            'B ) ', // hintText parametresi bu şekilde verilmelidir
          ),
          spaceHeight(space),
          buildInputContainer(
            'C ) ', // hintText parametresi bu şekilde verilmelidir
          ),
          spaceHeight(space),
          buildInputContainerFalse('D ) '),
        ],
      ),
    );
  }

  Widget buildContainerEmpty() {
    double heightTopContainer = 8.71 * specialSizeHeight; // 70
    double paddingLeft = 36.9212 * specialSizeWidth;

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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10 * specialSize), // Alt boşluk
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end, // Tabana hizalama
          children: [
            Padding(
              padding: EdgeInsets.only(left: paddingLeft), // Sol boşluk
              child: const Text(
                "Puanınız: XXXX",
                style: TextStyle(
                  fontSize: fontSize,
                  fontStyle: FontStyle.italic,
                  color: ColorVariations.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVideoContainer() {
    double heightVideo = 34.84 * specialSizeHeight; // 280

    var panelWidth = specialSizeWidth * 100 >= 600
        ? specialSizeWidth * 60
        : specialSizeWidth * 100;
    return Container(
      width: panelWidth,
      height: heightVideo,
      decoration: BoxDecoration(
        color: ColorVariations.secondaryColor,
        border: Border.all(
          width: borderWidth * 2,
          color: ColorVariations.borderColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(borderRadiusValue / 2),
        ),
      ),
    );
  }

  Widget buildInputContainer(String hintText) {
    double inputWidth = 89.12 * specialSizeWidth; // 350
    double inputHeight = 6.22 * specialSizeHeight; // 50

    return Container(
      width: inputWidth,
      height: inputHeight,
      decoration: BoxDecoration(
        color: ColorVariations.primaryColor,
        borderRadius: BorderRadius.circular(specialSize * 20),
        shape: BoxShape.rectangle,
        border: Border.all(
          width: specialSize,
          color: ColorVariations.borderColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // butona tıklayınca
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorVariations.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(specialSize * 20),
                ),
              ),
              child: Align(
                alignment: Alignment
                    .centerLeft, // Yazının sol tarafa dayalı hizalaması
                child: Padding(
                  padding: const EdgeInsets.only(left: specialSize * 10),
                  child: Text(
                    hintText,
                    style: const TextStyle(
                      color: ColorVariations.textColor,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputContainerTrue(String hintText) {
    double inputWidth = 89.12 * specialSizeWidth; // 350
    double inputHeight = 6.22 * specialSizeHeight; // 50

    return Container(
      width: inputWidth,
      height: inputHeight,
      decoration: BoxDecoration(
        color: ColorVariations.trueColor,
        borderRadius: BorderRadius.circular(specialSize * 20),
        shape: BoxShape.rectangle,
        border: Border.all(
          width: specialSize,
          color: ColorVariations.trueColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // butona tıklayınca
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorVariations.trueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(specialSize * 20),
                ),
              ),
              child: Align(
                alignment: Alignment
                    .centerLeft, // Yazının sol tarafa dayalı hizalaması
                child: Padding(
                  padding: const EdgeInsets.only(left: specialSize * 10),
                  child: Text(
                    hintText,
                    style: const TextStyle(
                      color: ColorVariations.textColor,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputContainerFalse(String hintText) {
    double inputWidth = 89.12 * specialSizeWidth; // 350
    double inputHeight = 6.22 * specialSizeHeight; // 50

    return Container(
      width: inputWidth,
      height: inputHeight,
      decoration: BoxDecoration(
        color: ColorVariations.falseColor,
        borderRadius: BorderRadius.circular(specialSize * 20),
        shape: BoxShape.rectangle,
        border: Border.all(
          width: specialSize,
          color: ColorVariations.falseColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // butona tıklayınca
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorVariations.falseColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(specialSize * 20),
                ),
              ),
              child: Align(
                alignment: Alignment
                    .centerLeft, // Yazının sol tarafa dayalı hizalaması
                child: Padding(
                  padding: const EdgeInsets.only(left: specialSize * 10),
                  child: Text(
                    hintText,
                    style: const TextStyle(
                      color: ColorVariations.textColor,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget logInButton(BuildContext context) {
    double buttonwidth = 38.194 * specialSizeWidth; // 150
    double buttonHeight = 4.97 * specialSizeHeight; // 40

    return SizedBox(
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
            "Kontrol Et",
            style: TextStyle(
              fontSize: fontSize,
              color: ColorVariations.textColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget circleButton(BuildContext context, IconData icon) {
    double buttonHeight = 4.97 * specialSizeHeight;
    return Container(
      width: buttonHeight,
      height: buttonHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2 * specialSize,
          color: const Color(0xFF6247AA), // Border color
        ),
      ),
      child: IconButton(
        onPressed: () {
          // button click action
        },
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.white,
        splashRadius: iconSize,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

Widget spaceHeight(double height) => SizedBox(height: height);
Widget spaceWidth(double width) => SizedBox(width: width);
