import 'package:education/recurring/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget _buildText(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorVariations.primaryColor,
      ),
      child: Align(
        alignment: Alignment.centerLeft, // Metni sola hizalar
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: ColorVariations.textColor,
          ),
        ),
      ),
    );
  }

  Widget buildPhotoButton() {
    double photoButton = 60;
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
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
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogoutButton() {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: ColorVariations.falseColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () {
          // Buraya çıkış yapılacak işlemler gelebilir
        },
        child: const Text(
          "Çıkış Yap",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
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
          'Profil',
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Call the buildPhotoButton() method here
            buildPhotoButton(),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Profil fotoğrafımı değiştir",
                style: TextStyle(
                  fontSize: 12,
                  color: ColorVariations.transparentTextColor,
                ),
              ),
            ),
            const SizedBox(height: 60),
            // Add 3 text fields here
            _buildText("Kullanıcı Adı: "),
            const SizedBox(height: 30),
            _buildText("E-mail:  "),
            const SizedBox(height: 30),
            _buildText("Puanınız: "),
            const SizedBox(height: 60),
            buildLogoutButton(),
          ],
        ),
      ),
    );
  }
}
