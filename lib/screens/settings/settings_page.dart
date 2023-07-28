import 'package:education/recurring/colors.dart';
import 'package:education/screens/settings/how_to_play.dart';
import 'package:education/screens/settings/password.dart';
import 'package:education/screens/settings/profile.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  // Yeni butonları oluşturan fonksiyon (widget)
  Widget _buildButton(String buttonText, VoidCallback onPressed) {
    return SizedBox(
      width: 300,
      height: 40,
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
            fontSize: 16,
            color: Colors.white,
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
          'Ayarlar',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          children: [
            const SizedBox(height: 50),
            _buildButton("Profil", () {
              // Buton 1 tıklandığında yapılacak işlemler
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()));
            }),
            const SizedBox(height: 50),
            _buildButton("Şifre değiştirme", () {
              // Buton 1 tıklandığında yapılacak işlemler
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PasswordPage()));
            }),
            const SizedBox(height: 50),
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
}
