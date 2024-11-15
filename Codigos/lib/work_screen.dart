import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'bio_screen.dart';
import 'home_screen.dart';

class WorkScreen extends StatefulWidget {
  @override
  _WorkScreenState createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  int _selectedIndex = 0;
  bool showCard = false;
  int _currentPage = 0;

  final List<String> carouselImages = [
    'https://github.com/user-attachments/assets/085f4668-9f99-424e-910c-7c5d03635962',
    'https://github.com/user-attachments/assets/ec97358e-2404-49c6-b5d8-7d9a73874c0d',
    'https://github.com/user-attachments/assets/e4df2134-d22d-4f43-b86b-fd83e6fdbdd1',
    'https://github.com/user-attachments/assets/6a16d363-6b24-46d7-9a68-4a1cbd88f77c',
    'https://github.com/user-attachments/assets/98960b04-d6c6-465e-99b6-6cddf7bd9102',
  ];

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _revealCard() {
    setState(() {
      showCard = true;
    });
  }

  void _nextPage() {
    setState(() {
      _currentPage = (_currentPage + 1) % carouselImages.length;
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  void _previousPage() {
    setState(() {
      _currentPage =
          (_currentPage - 1 + carouselImages.length) % carouselImages.length;
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://github.com/user-attachments/assets/cc0320e4-ad7a-4ae0-a191-7b9ecd6fc907'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (!showCard)
            Positioned.fill(
              child: GestureDetector(
                onTap: _revealCard,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Image.network(
                          'https://github.com/user-attachments/assets/f460eab1-039d-42bd-aed7-31b9ba1cdf4e',
                          fit: BoxFit.contain, // Ajustando para evitar corte
                        ),
                      ),
                      Text(
                        'Clique na tela',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (showCard)
            Positioned.fill(
              child: PageView.builder(
                controller: _pageController,
                itemCount: carouselImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Image.network(
                      carouselImages[index],
                      fit: BoxFit.fitWidth,
                    ),
                  );
                },
                physics: BouncingScrollPhysics(),
                onPageChanged: (int pageIndex) {
                  setState(() {
                    _currentPage = pageIndex;
                  });
                },
              ),
            ),
          if (showCard)
            Positioned(
              bottom: 10,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff343334)
                      .withOpacity(0.5), // Círculo cinza transparente
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xffabd904)),
                  onPressed: _previousPage,
                  iconSize: 40,
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(),
                ),
              ),
            ),
          if (showCard)
            Positioned(
              bottom: 10,
              right: 30,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff343334)),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward, color: Color(0xffabd904)),
                  onPressed: _nextPage,
                  iconSize: 40,
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xff343334),
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
