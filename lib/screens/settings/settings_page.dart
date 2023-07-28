import 'package:education/recurring/colors.dart';
import 'package:education/screens/settings/how_to_play.dart';
import 'package:education/screens/settings/password.dart';
import 'package:education/screens/settings/profile.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double get specialSizeWidth => MediaQuery.of(context).size.width / 100;
  double get specialSizeHeight => MediaQuery.of(context).size.height / 100;

  static const double specialSize = 1;
  static const double fontSize = 8;
  static const double space = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ayarlar',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: space * 3.5, vertical: space),
        child: Column(
          children: [
            spaceHeight(space),
            _buildButton("Profil", () {
              // Buton 1 tıklandığında yapılacak işlemler
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()));
            }),
            spaceHeight(space),
            _buildButton("Şifre değiştirme", () {
              // Buton 1 tıklandığında yapılacak işlemler
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PasswordPage()));
            }),
            spaceHeight(space),
            _buildButton("Nasıl Oynanır ?", () {
              // Buton 2 tıklandığında yapılacak işlemler
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HowToPlayPage()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText, VoidCallback onPressed) {
    double buttonWidth = 76.388 * specialSizeWidth;
    double buttonHeight = 4.977 * specialSizeHeight;
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorVariations.secondaryColor,
          shadowColor: Colors
              .transparent, // Gölgeyi kaldırmak için shadowColor parametresi eklendi
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: fontSize * 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

Widget spaceHeight(double height) => SizedBox(height: height);
