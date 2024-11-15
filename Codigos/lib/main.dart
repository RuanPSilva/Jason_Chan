import 'package:flutter/material.dart';

// Importações das páginas
import 'home_screen.dart';

void main() {
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove o banner de debug
      home: GameHomeScreen(),
    );
  }
}

class GameHomeScreen extends StatefulWidget {
  @override
  _GameHomeScreenState createState() => _GameHomeScreenState();
}

class _GameHomeScreenState extends State<GameHomeScreen> {
  @override
  void initState() {
    super.initState();
    // Navegar para a tela de personagens após 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomeScreen()), // Altere para sua tela de personagens
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://github.com/user-attachments/assets/90943f39-5a5e-46bd-ad0f-5ddb831b0e26',
                ),
                fit: BoxFit.cover, // Ajusta a imagem para cobrir toda a tela
              ),
            ),
          ),

          // Conteúdo sobreposto à imagem de fundo
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.all(20.0), // Adiciona espaço nas bordas
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
