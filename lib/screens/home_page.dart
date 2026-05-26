import 'package:flutter/material.dart';                      
import '../database/database_helper.dart';
import '../models/frase_model.dart';
// ignore: unused_import
import 'package:toque_fale/services/tts_service.dart';
import '../widgets/botao_frase.dart';
// ignore: unused_import
import 'frase_form_page.dart';
import 'perfil_page.dart';
import 'comunicados_page.dart';
// ignore: duplicate_import
import 'package:toque_fale/screens/frase_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<FraseModel> frases = [];

  int paginaAtual = 0;

  @override
  void initState() {
    super.initState();
    carregarFrases();
  }

   Future falar(String texto) async {
    await TtsService.falar(texto);

  }

  Future<void> carregarFrases() async {

  final lista = await DatabaseHelper().listarFrases();

  setState(() {

    frases = lista;

  });

  print('TOTAL: ${frases.length}');
}

  Future excluirFrase(int id) async {
    await _dbHelper.deletarFrase(id);
    carregarFrases();
  }

  Future<void> abrirFormulario({FraseModel? frase}) async {

  final resultado = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => FraseFormPage(
        frase: frase,
        onSave: carregarFrases,
      ),
    ),
  );

  if (resultado == true) {
    carregarFrases();
  }
}

  Widget paginaHome() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
            ),
            itemCount: frases.length,
            itemBuilder: (context, index) {

              final frase = frases[index];

                return BotaoFrase(

                 frase: frase,

                 texto: frase.texto,

                  icone: IconData(
                 // ignore: non_const_argument_for_const_parameter
                 frase.icone,
                  fontFamily: 'MaterialIcons',
               ),

               cor: Color(frase.cor),

               onTap: () {

                  falar(frase.texto);

                },

              onLongPress: () {

      showModalBottomSheet(

        context: context,

        builder: (_) {

          return Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              ListTile(

                leading: const Icon(Icons.edit),

                title: const Text('Editar'),

                onTap: () {

                  Navigator.pop(context);

                  abrirFormulario(
                    frase: frase,
                  );
                },
              ),

              ListTile(

                leading: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),

                title: const Text(
                  'Excluir',
                ),

                onTap: () {

                  Navigator.pop(context);

                  excluirFrase(
                    frase.id!,
                  );
                },
              ),
            ],
          );
        },
      );
    },
  );
},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () => abrirFormulario(),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              backgroundColor: Colors.green,
            ),
            child: const Text(
              'Adicionar Frase',
              style: TextStyle(
                fontSize: 20,
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
    final paginas = [
      paginaHome(),
      const ComunicadosPage(),
      const PerfilPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toque & Fale'),
      ),
      body: paginas[paginaAtual],
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Comunicados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

