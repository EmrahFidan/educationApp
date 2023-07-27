// ignore_for_file: library_private_types_in_public_api

import 'package:education/screens/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:education/recurring/colors.dart';
import 'package:education/screens/favorities_page.dart';
import 'package:education/screens/ranked_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(), // Uygulamanın ana sayfası
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPanelOpen = false;

  double get specialSizeWidth => MediaQuery.of(context).size.width / 100;
  double get specialSizeHeight => MediaQuery.of(context).size.height / 100;

  void togglePanel() {
    setState(() {
      isPanelOpen = !isPanelOpen;
    });
  }

  Widget buildMenuButton(
    BuildContext context,
    bool isPanelOpen,
    void Function() togglePanel,
    double panelWidth,
  ) {
    double iconSize = specialSizeWidth * 7;
    if (MediaQuery.of(context).size.width >= 568) {
      iconSize = 35;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: specialSizeWidth * 5,
        vertical: specialSizeHeight * 5.5,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
            left: specialSizeWidth * 1.5,
            top: specialSizeHeight * 2,
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const LoginPage(),
                //   ),
                // );
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorVariations.textColor,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  Icons.person_outline_outlined,
                  size: iconSize,
                  color: ColorVariations.textColor,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: specialSizeHeight * 2,
              right: specialSizeWidth * 2,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  SizedBox(
                    width: specialSizeWidth * 10,
                    height: specialSizeHeight * 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        backgroundColor: ColorVariations.primaryColor,
                      ),
                      onPressed: togglePanel,
                      child: Image.asset(
                        'assets/menu.png',
                        color: ColorVariations.textColor,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPanelButton(
    BuildContext context,
    String text,
    IconData icon,
    Widget page,
    double panelWidth,
  ) {
// ColorVariations.darkText

    return Padding(
      padding: EdgeInsets.only(
        bottom: specialSizeHeight * 2, // Ekran yüksekliğine göre alt boşluk
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          backgroundColor: ColorVariations.secondaryColor,
          minimumSize: Size(
              double.infinity,
              specialSizeHeight *
                  12), // Ekran yüksekliğine göre minimum düğme boyutu
        ),
        child: Row(
          children: [
            SizedBox(
              width: specialSizeWidth * 20,
              height: specialSizeHeight * 10,
              child: Icon(
                icon,
                size:
                    specialSizeWidth * 8, // Ekran genişliğine göre simge boyutu
                color: ColorVariations.textColor,
              ),
            ),
            SizedBox(
                width: specialSizeWidth * 1), // Ekran genişliğine göre boşluk
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: specialSizeWidth *
                      5, // Ekran genişliğine göre metin boyutu
                  color: ColorVariations.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPanel(BuildContext context, double panelWidth) {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      width: panelWidth,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 50, // Ekran genişliğine göre yatay padding
        ),
        color: ColorVariations.secondaryColor,
        child: Center(
          // Yatayda ve dikeyde merkezlemek için Center widget kullan
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Dikeyde merkez
            crossAxisAlignment: CrossAxisAlignment.center, // Yatayda merkez
            children: [
              buildPanelButton(
                context,
                'Ayarlar',
                Icons.settings_outlined,
                const SettingsPage(),
                panelWidth,
              ),
              buildPanelButton(
                context,
                'Favoriler',
                Icons.favorite_border_outlined,
                const FavoritiesPage(),
                panelWidth,
              ),
              buildPanelButton(
                context,
                'Sıralama',
                Icons.account_tree_outlined,
                const RankedPage(),
                panelWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 250),
      child: Column(
        children: [
          Container(
            width: 98,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorVariations.textColor,
                width: 1,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/adu.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 80),
          const Text(
            'Uygulama Adı',
            style: TextStyle(
              color: ColorVariations.textColor,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
              fontSize: 35,
            ),
          ),
          const SizedBox(height: 70),
          Container(
            width: 160,
            height: 50,
            decoration: BoxDecoration(
              color: ColorVariations.secondaryColor,
              borderRadius: BorderRadius.circular(27),
              border: Border.all(
                color: ColorVariations.textColor,
                width: 1,
              ),
            ),
            child: TextButton(
              onPressed: () {
                // Butona tıklandığında yapılacak işlemler
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const VideoPage()),
                // );
              },
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                  (states) => ColorVariations.secondaryColor.withOpacity(0.2),
                ),
              ),
              child: const Text(
                'Öğrenmeye Başla',
                style: TextStyle(
                  color: ColorVariations.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorVariations.primaryColor,
      body: GestureDetector(
        onTap: () {
          if (isPanelOpen) {
            togglePanel();
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (!isPanelOpen) buildBody(context),
            LayoutBuilder(
              builder: (context, constraints) {
                final maxWidth = constraints.maxWidth;
                final panelWidth = maxWidth >= 578 ? 175.0 : maxWidth * 0.2;

                return buildMenuButton(
                  context,
                  isPanelOpen,
                  togglePanel,
                  panelWidth,
                );
              },
            ),
            if (isPanelOpen)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: specialSizeWidth * 75,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return buildPanel(
                      context,
                      constraints.maxWidth,
                    );
                  },
                ),
              ),
            // buildBody(), // Yeni fonksiyonu burada çağırın
          ],
        ),
      ),
    );
  }
}

// yükseklik: 803.636636636636;
// genişlik: 392.72727272727275;

// 8.03636636636636
// 3.927272727272727