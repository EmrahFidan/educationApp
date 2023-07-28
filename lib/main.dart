// ignore_for_file: library_private_types_in_public_api

import 'package:education/screens/login/signUp_page.dart';
import 'package:education/screens/play/play.dart';
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

  static const double specialSize = 1;

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

    double paddingScreenH = specialSizeWidth * 5;
    double paddingScreenV = specialSizeHeight * 5.5;
    double iconleft = specialSizeWidth * 1.5;
    double icontop = specialSizeHeight * 2;
    double menuButtonHeight = specialSizeHeight * 5;
    double menuButtonWidth = specialSizeWidth * 10;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingScreenH,
        vertical: paddingScreenV,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
            left: iconleft,
            top: icontop,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: Container(
                width: 45 * specialSize,
                height: 45 * specialSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorVariations.textColor,
                    width: 1.5 * specialSize,
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
              top: icontop,
              right: icontop,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  SizedBox(
                    width: menuButtonWidth,
                    height: menuButtonHeight,
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
    double paddingBottom = specialSizeHeight * 2;
    double buttonPanelSpace = specialSizeHeight * 12;
    double buttonPanelHeight = specialSizeHeight * 10;
    double buttonPanelWidth = specialSizeWidth * 7;

    return Padding(
      padding: EdgeInsets.only(
        bottom: paddingBottom, // Ekran yüksekliğine göre alt boşluk
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
          minimumSize: Size(double.infinity, buttonPanelSpace),
        ),
        child: Row(
          children: [
            SizedBox(
              width: buttonPanelWidth,
              height: buttonPanelHeight,
              child: Icon(
                icon,
                size: 30 * specialSize, // Ekran genişliğine göre simge boyutu
                color: ColorVariations.textColor,
              ),
            ),
            spaceWidth(specialSizeWidth),
            // Ekran genişliğine göre boşluk
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize:
                      20 * specialSize, // Ekran genişliğine göre metin boyutu
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
          horizontal: 70 * specialSize, // Ekran genişliğine göre yatay padding
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
    double marginTop = specialSizeHeight * 31.1085;
    double space = specialSizeHeight * 0.99547;
    double playButtonHeight = specialSizeHeight * 6.2217;
    double playButtonWidth = specialSizeWidth * 40.7407;

    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: Column(
        children: [
          Container(
            width: 98 * specialSize,
            height: 90 * specialSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorVariations.textColor,
                width: specialSize,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/adu.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          spaceHeight(8 * space),
          const Text(
            'Uygulama Adı',
            style: TextStyle(
              color: ColorVariations.textColor,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
              fontSize: 35 * specialSize,
            ),
          ),
          spaceHeight(7 * space),
          Container(
            width: playButtonWidth,
            height: playButtonHeight,
            decoration: BoxDecoration(
              color: ColorVariations.secondaryColor,
              borderRadius: BorderRadius.circular(27 * specialSize),
              border: Border.all(
                color: ColorVariations.textColor,
                width: specialSize,
              ),
            ),
            child: TextButton(
              onPressed: () {
                // Butona tıklandığında yapılacak işlemler
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VideoPage()),
                );
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
                width: 350 * specialSize,
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

Widget spaceHeight(double height) => SizedBox(height: height);
Widget spaceWidth(double width) => SizedBox(width: width);
