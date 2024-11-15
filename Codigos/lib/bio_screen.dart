import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Importações das páginas
import 'home_screen.dart';
import 'work_screen.dart';

class BioScreen extends StatefulWidget {
  @override
  _BioScreenState createState() => _BioScreenState();
}

// Classe para a tela de detalhes
class MaisInfo extends StatelessWidget {
  final String imageUrl;
  final String description;

  MaisInfo({required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Center(
        child: Card(
          color: Color(0xff2b2b2b),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Foto de perfil e nome
                    Row(
                      children: [
                        SizedBox(width: 20),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://github.com/user-attachments/assets/c1417d0f-ca63-418c-9c5f-269d3ceecd8e',
                          ), // Foto de perfil
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Jason Chan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // Botão de fechar
                    IconButton(
                      icon: Icon(Icons.close, color: Color(0xffffffff)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Imagem principal
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 20),

                // Descrição com barra de rolagem
                Container(
                  height: 105, // Limita a altura do container
                  child: SingleChildScrollView(
                    child: Text(
                      description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BioScreenState extends State<BioScreen> {
  int _selectedIndex = 2;

  // Lista de imagens e descrições
  final List<Map<String, String>> items = [
    // Post 1
    {
      'imageUrl':
          'https://github.com/user-attachments/assets/ac34464e-a350-4f97-958c-aec115e0ed25',
      'description':
          'Introdução: Conheça Jason Chan, um dos ilustradores digitais mais celebrados da atualidade! De games a ilustrações épicas de fantasia, ele encanta e inspira artistas e fãs pelo mundo.',
    },
    // Post 2
    {
      'imageUrl':
          'https://github.com/user-attachments/assets/f3f52b94-ddc5-435a-995a-702218d9ea07',
      'description':
          'Início da Carreira: Jason Chan descobriu sua paixão pelo desenho ainda jovem. Com influências de anime, quadrinhos e RPG, ele decidiu transformar seu hobby em profissão. A formação em ilustração o levou a explorar o mundo da fantasia visual.',
    },
    // Post 3
    {
      'imageUrl':
          'https://github.com/user-attachments/assets/9c90fb0d-2fc2-404a-80d0-bfbb2d9fc97b',
      'description':
          'A Ascensão na Indústria dos Games: Após a faculdade, Jason iniciou sua carreira na indústria dos jogos, integrando a equipe de grandes estúdios e contribuindo para títulos icônicos. Ele rapidamente se destacou com seu talento em criar mundos e personagens envolventes.',
    },
    // Post 4
    {
      'imageUrl':
          'https://github.com/user-attachments/assets/62324c19-40c1-4162-a54b-00924f14b8a1',
      'description':
          'Estilo Artístico: Jason é conhecido por um estilo detalhado e imersivo, com destaque para o uso de cores dramáticas e expressões faciais profundas. Suas obras capturam a essência dos personagens, mesclando fantasia e realidade de maneira única.',
    },
    //poste 5
    {
      'imageUrl':
          'https://github.com/user-attachments/assets/2aa15f10-e478-4333-b4a8-dba082a8fd8b',
      'description':
          'Contribuições para Magic: The Gathering: Jason também fez ilustrações para o famoso jogo de cartas Magic: The Gathering, onde seu talento trouxe vida a personagens e criaturas lendárias, deixando uma marca inesquecível no universo do jogo.',
    },
    // Post 6
    {
      'imageUrl':
          'https://github.com/user-attachments/assets/3b6017b1-12e5-4112-9f2c-53826bae5ffb',
      'description':
          'Influência e Referências: As influências de Jason vão de animes a mestres da pintura clássica. Ele cita artistas como Yoshitaka Amano e Norman Rockwell como inspirações, incorporando seu amor por histórias visuais em cada projeto.',
    },
    // Post 7
    {
      'imageUrl':
          'https://github.com/user-attachments/assets/ba37c66b-9aa8-4b55-8226-feaf444b0c49',
      'description':
          'Impacto na Arte Conceitual: Jason Chan é hoje uma referência para ilustradores e designers. Ele contribuiu para elevar o valor da arte conceitual e inspirou a nova geração de artistas digitais a explorarem suas próprias visões.',
    },
    // Post 8
    {
      'imageUrl':
          'https://github.com/user-attachments/assets/564f8cf6-be0b-42f3-9caa-94d919052b15',
      'description':
          'A Vida Além da Arte: Jason acredita em equilibrar trabalho e vida pessoal, e compartilha essa filosofia com novos artistas. Ele valoriza a liberdade criativa e incentiva outros a buscarem autenticidade em suas carreiras.',
    },
    // Post 9
    {
      'imageUrl':
          'https://github.com/user-attachments/assets/1cb6650a-edeb-42bf-90ab-4737e54f7d5b',
      'description':
          'Legado e Futuro: Com uma carreira impressionante, Jason Chan continua a explorar novas fronteiras. Cada trabalho seu é uma oportunidade de transportar fãs para novos universos, reafirmando seu papel como um mestre da ilustração digital.',
    },
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
            // Banner ***
            //
            Stack(
              clipBehavior: Clip.hardEdge,
              fit: StackFit.loose,
              children: [
                Positioned.fill(
                  child: Container(
                    height: 250, // Aumente a altura conforme necessário
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://github.com/user-attachments/assets/837ee8c8-e66b-4f9b-a248-ef6fbae29a13',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //
            // Área de Informações ***
            //
            Container(
              decoration: BoxDecoration(
                color: Color(0xff2b2b2b),
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal:
                      65), // Menor padding vertical para reduzir a altura
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topLeft,
                    children: [
                      //
                      // Foto de Perfil com Sobreposição ao Banner
                      //
                      Positioned(
                        top:
                            -60, // Ajuste de posição para que metade do avatar fique sobre o banner
                        left: -15,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://github.com/user-attachments/assets/c1417d0f-ca63-418c-9c5f-269d3ceecd8e',
                          ),
                        ),
                      ),
                      //
                      // Nome e outras informações
                      //
                      Padding(
                        padding: const EdgeInsets.only(
                            left:
                                100), // Deslocamento para que o texto fique à direita do avatar
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jason Chan',
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 10),
            //
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Eu desenho coisas para livros e jogos de vídeo👾',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20), // Espaçamento antes da seção de métricas

            // Seção de Posts e Seguidores ***
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Posts',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '201', // Número de posts
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 1, // Define a largura do divisor
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Seguidores',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '75,3 Mil', // Número de seguidores
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 5), // Espaçamento antes da área de posts

            //
            // Área de posts ***
            //
            // GridView com 9 imagens e descrições
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    // Ao clicar na imagem, abre a nova tela com detalhes
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MaisInfo(
                          imageUrl: item['imageUrl']!,
                          description: item['description']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // aplica o arredondamento também à imagem
                      child: Image.network(
                        item['imageUrl']!,
                        fit: BoxFit.cover,
                        width: double
                            .infinity, // garante que a imagem cubra toda a largura do container
                        height: double
                            .infinity, // garante que a imagem cubra toda a altura do container
                      ),
                    ),
                  ),
                );
              },
            )

            // Rodapé
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
