import 'package:flutter/material.dart';

import '../models/frase_model.dart';
import '../widgets/botao_frase.dart';

import 'comunicados_page.dart';
import 'perfil_page.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int paginaAtual = 0;

  final TextEditingController controller =
      TextEditingController();

  List<FraseModel> frases = [

    FraseModel(
      texto: "Quero Água",
      icone: Icons.local_drink,
      cor: Colors.blue,
    ),
    FraseModel(
      texto: "Estou Com Dor",
      icone: Icons.healing,
      cor: const Color.fromARGB(255, 253, 93, 0),
    ),
    FraseModel(
      texto: "Ajuda",
      icone: Icons.warning,
      cor: const Color.fromARGB(255, 248, 17, 0),
    ),

    FraseModel(
      texto: "Banheiro",
      icone: Icons.wc,
      cor: Colors.green,
    ),
    FraseModel(
      texto: "Estou Com Fome",
      icone: Icons.local_dining,
      cor: Colors.orange,
    ),
    FraseModel(
      texto: "Quero Ir Para Casa",
      icone: Icons.home,
      cor: Colors.blueGrey,
    ),
  ];

   void abrirDialog() {

    IconData iconeSelecionado =
        FontAwesomeIcons.whatsapp;

    Color corSelecionada = Colors.blue;

    List<IconData> icones = [

      FontAwesomeIcons.whatsapp,
      FontAwesomeIcons.house,
      FontAwesomeIcons.bed,
      FontAwesomeIcons.toilet,
      FontAwesomeIcons.glassWater,
      FontAwesomeIcons.burger,
      FontAwesomeIcons.phone,
      FontAwesomeIcons.heart,
      FontAwesomeIcons.triangleExclamation,
      FontAwesomeIcons.userDoctor,
    ];

    List<Color> cores = [

      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
    ];

    showDialog(

      context: context,

      builder: (context) {

        return StatefulBuilder(

          builder: (context, setStateDialog) {

            return AlertDialog(

              title: const Text("Nova frase"),

              content: SingleChildScrollView(

                child: Column(

                  mainAxisSize: MainAxisSize.min,

                  children: [

                    TextField(

                      controller: controller,

                      decoration: const InputDecoration(
                        hintText: "Digite a frase",
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(

                      "Escolha um ícone",

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Wrap(

                      spacing: 10,
                      runSpacing: 10,

                      children: icones.map((icone) {

                        bool selecionado =
                            iconeSelecionado == icone;

                        return GestureDetector(

                          onTap: () {

                            setStateDialog(() {

                              iconeSelecionado = icone;
                            });
                          },

                          child: Container(

                            padding: const EdgeInsets.all(12),

                            decoration: BoxDecoration(

                              color: selecionado
                                  ? Colors.blue
                                  : Colors.grey.shade300,

                              borderRadius:
                                  BorderRadius.circular(15),
                            ),

                            child: Icon(

                              icone,

                              color: selecionado
                                  ? Colors.white
                                  : Colors.black,

                              size: 30,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 25),

                    const Text(

                      "Escolha uma cor",

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Wrap(

                      spacing: 10,
                      runSpacing: 10,

                      children: cores.map((cor) {

                        bool selecionada =
                            corSelecionada == cor;

                        return GestureDetector(

                          onTap: () {

                            setStateDialog(() {

                              corSelecionada = cor;
                            });
                          },

                          child: Container(

                            width: 40,
                            height: 40,

                            decoration: BoxDecoration(

                              color: cor,
                              shape: BoxShape.circle,

                              border: selecionada
                                  ? Border.all(
                                      color: Colors.black,
                                      width: 3,
                                    )
                                  : null,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              actions: [

                TextButton(

                  onPressed: () {
                    Navigator.pop(context);
                  },

                  child: const Text("Cancelar"),
                ),

                ElevatedButton(

                  onPressed: () {

                    if (controller.text.isNotEmpty) {

                      setState(() {

                        frases.add(

                          FraseModel(

                            texto: controller.text,

                            icone: iconeSelecionado,

                            cor: corSelecionada,
                          ),
                        );
                      });

                      controller.clear();

                      Navigator.pop(context);
                    }
                  },

                  child: const Text("Adicionar"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget telaHome() {

    return Column(

      children: [

        Expanded(

          child: GridView.builder(

            padding: const EdgeInsets.all(20),

            itemCount: frases.length,

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: 1.0,
            ),

            itemBuilder: (context, index) {

              return BotaoFrase(

                texto: frases[index].texto,
                icone: frases[index].icone,
                cor: frases[index].cor,
              );
            },
          ),
        ),

        Padding(

          padding: const EdgeInsets.all(20),

          child: ElevatedButton(

            onPressed: abrirDialog,

            style: ElevatedButton.styleFrom(

              backgroundColor: Colors.green,
              minimumSize: const Size(
                double.infinity,
                60,
              ),
            ),

            child: const Text(

              "Adicionar Frase",

              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFD9E3E4),

      appBar: AppBar(

        backgroundColor: Colors.white,
        centerTitle: true,

        title: Text(

          paginaAtual == 0
              ? "Toque & Fale"
              : paginaAtual == 1
                  ? "Comunicados"
                  : "Perfil",

          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: IndexedStack(

        index: paginaAtual,

        children: [

          telaHome(),

          const ComunicadosPage(),

          const PerfilPage(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: paginaAtual,

        onTap: (index) {

          setState(() {

            paginaAtual = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Comunicados",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}