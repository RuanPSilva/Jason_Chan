import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Importações das páginas
import 'bio_screen.dart';
import 'work_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  final List<String> imageUrls = [
    'https://github.com/user-attachments/assets/e16b92e2-84c9-4590-8aec-7c43045fea0b',
    'https://github.com/user-attachments/assets/cc812ece-f6cc-45a6-bffe-3677be9c2cb7',
    'https://github.com/user-attachments/assets/5e7a57f9-df81-4012-9292-433e8da4b440',
    'https://github.com/user-attachments/assets/e3ddb262-1e1c-4327-b7f3-d39b60c743e8',
    'https://github.com/user-attachments/assets/26cd5bb1-05a9-4499-a2a7-36384be7e673',
    'https://github.com/user-attachments/assets/9be32a5b-b1a2-4493-8d7c-168018363000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b), // Cor de fundo
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //
            // Slider de Fotos ***
            //
            CarouselSlider(
              options: CarouselOptions(
                height: 150, // Altura do slider
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            // Foto de Perfil Circular
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://github.com/user-attachments/assets/83e5c377-ddf7-43cb-abbc-a9583b8036ba',
                ),
              ),
            ),

            // Nome e Texto de Introdução
            Column(
              children: [
                Text(
                  'Jason Chan',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Este trabalho tem como objetivo o desenvolvimento de um aplicativo móvel sobre o artista Jason Chan, com foco em sua carreira e nas empresas de jogos pelas quais passou. O projeto foi realizado no contexto de uma disciplina de desenvolvimento de aplicativos móveis, com a finalidade de aprender e aplicar os conceitos do Flutter, explorando os diversos elementos e widgets oferecidos pelo framework.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xff343334), // Cor do fundo da barra de navegação
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: GNav(
            selectedIndex: _selectedIndex,
            color: Color(0x85000000),
            activeColor: Color(0xffabd904),
            tabBackgroundColor: Color(0x4d5fa90c),
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
              if (index == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WorkScreen()));
              } else if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              } else if (index == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BioScreen()));
              }
            },
            padding: EdgeInsets.all(8),
            tabs: [
              GButton(
                icon: Icons.shield_rounded,
              ),
              GButton(
                icon: Icons.house,
              ),
              GButton(
                icon: Icons.account_circle_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
