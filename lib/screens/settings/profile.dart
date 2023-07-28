import 'package:education/recurring/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double get specialSizeWidth => MediaQuery.of(context).size.width / 100;
  double get specialSizeHeight => MediaQuery.of(context).size.height / 100;

  static const double specialSize = 1;
  static const double fontSize = 15;
  static const double space = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profil',
          style: TextStyle(
            fontSize: fontSize * 3,
            fontStyle: FontStyle.italic,
            color: Color(0xFFCCC9DC),
          ),
        ),
        toolbarHeight: 70 * specialSize,
        backgroundColor: ColorVariations.secondaryColor,
      ),
      backgroundColor: ColorVariations.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 3 * space, vertical: 3 * space),
        child: Column(
          children: [
            const SizedBox(height: space * 3),
            // Call the buildPhotoButton() method here
            buildPhotoButton(),
            const SizedBox(height: space * 2),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Profil fotoğrafımı değiştir",
                style: TextStyle(
                  fontSize: fontSize - 3,
                  color: ColorVariations.transparentTextColor,
                ),
              ),
            ),
            const SizedBox(height: 6 * space),
            // Add 3 text fields here
            _buildText("Kullanıcı Adı: "),
            const SizedBox(height: 3 * space),
            _buildText("E-mail:  "),
            const SizedBox(height: 3 * space),
            _buildText("Puanınız: "),
            const SizedBox(height: 6 * space),
            buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: fontSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8 * specialSize),
        color: ColorVariations.primaryColor,
      ),
      child: Align(
        alignment: Alignment.centerLeft, // Metni sola hizalar
        child: Text(
          text,
          style: const TextStyle(
            fontSize: fontSize + 3,
            color: ColorVariations.textColor,
          ),
        ),
      ),
    );
  }

  Widget buildPhotoButton() {
    double photoButton = 60 * specialSize;

    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25 * specialSize),
            ),
            backgroundColor: ColorVariations.secondaryColor,
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
          ),
        ),
      ),
    );
  }

  Widget buildLogoutButton() {
    double buttonWidth = 25.4629 * specialSizeWidth;
    double buttonHeight = 4.97 * specialSizeHeight;
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        color: ColorVariations.falseColor,
        borderRadius: BorderRadius.circular(20 * specialSize),
      ),
      child: TextButton(
        onPressed: () {
          // Buraya çıkış yapılacak işlemler gelebilir
        },
        child: const Text(
          "Çıkış Yap",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: fontSize + 1,
            color: ColorVariations.textColor,
          ),
        ),
      ),
    );
  }
}
