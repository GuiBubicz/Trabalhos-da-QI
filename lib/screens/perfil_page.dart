import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  File? imagemPerfil;

  String? caminhoImagem;

   String nome = "Shaun Murphy";
  String idade = "19 anos";
  String suporte = "Nível 1";
  String telefone = "51999416-7998";
  String email = "qitarde1245@gmail.com";
  String endereco = "Assis Brasil, 666";

  final List<String> niveisSuporte = [
    "Nível 1",
    "Nível 2",
    "Nível 3",
  ];

  @override
  void initState() {
    super.initState();
    carregarPerfil();
  }

  Future<void> salvarPerfil() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("nome", nome);
    await prefs.setString("idade", idade);
    await prefs.setString("telefone", telefone);
    await prefs.setString("email", email);
    await prefs.setString("endereco", endereco);
    await prefs.setString("suporte", suporte);

    if (caminhoImagem != null) {
      await prefs.setString("imagem", caminhoImagem!);
    }
  }

  Future<void> carregarPerfil() async {

    final prefs = await SharedPreferences.getInstance();

    setState(() {

      nome = prefs.getString("nome") ?? nome;
      idade = prefs.getString("idade") ?? idade;
      telefone = prefs.getString("telefone") ?? telefone;
      email = prefs.getString("email") ?? email;
      endereco = prefs.getString("endereco") ?? endereco;
      suporte = prefs.getString("suporte") ?? suporte;

      caminhoImagem = prefs.getString("imagem");

      if (caminhoImagem != null) {
        imagemPerfil = File(caminhoImagem!);
      }
    });
  }

  Future<void> selecionarImagem() async {

    final picker = ImagePicker();

    final XFile? imagem =
        await picker.pickImage(source: ImageSource.gallery);

    if (imagem != null) {

      setState(() {

        caminhoImagem = imagem.path;
        imagemPerfil = File(imagem.path);

      });

      salvarPerfil();
    }
  }

  void editarPerfil() {

    TextEditingController nomeController =
        TextEditingController(text: nome);

    TextEditingController idadeController =
        TextEditingController(text: idade);

    TextEditingController telefoneController =
        TextEditingController(text: telefone);

    TextEditingController emailController =
        TextEditingController(text: email);

    TextEditingController enderecoController =
        TextEditingController(text: endereco);

    String suporteSelecionado = suporte;

    showDialog(

      context: context,

      builder: (context) {

        return StatefulBuilder(

          builder: (context, setModalState) {

            return AlertDialog(

              title: const Text("Editar Perfil"),

              content: SingleChildScrollView(

                child: Column(

                  mainAxisSize: MainAxisSize.min,

                  children: [

                    TextField(
                      controller: nomeController,
                      decoration: const InputDecoration(
                        labelText: "Nome",
                      ),
                    ),

                    TextField(
                      controller: idadeController,
                      decoration: const InputDecoration(
                        labelText: "Idade",
                      ),
                    ),

                    const SizedBox(height: 10),

                    DropdownButtonFormField<String>(

                      value: suporteSelecionado,

                      decoration: const InputDecoration(
                        labelText: "Nível de suporte",
                      ),

                      items: niveisSuporte.map((nivel) {

                        return DropdownMenuItem(
                          value: nivel,
                          child: Text(nivel),
                        );

                      }).toList(),

                      onChanged: (value) {

                        setModalState(() {

                          suporteSelecionado = value!;

                        });
                      },
                    ),

                    TextField(
                      controller: telefoneController,
                      decoration: const InputDecoration(
                        labelText: "Telefone",
                      ),
                    ),

                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                    ),

                    TextField(
                      controller: enderecoController,
                      decoration: const InputDecoration(
                        labelText: "Endereço",
                      ),
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

                    setState(() {

                      nome = nomeController.text;
                      idade = idadeController.text;
                      telefone = telefoneController.text;
                      email = emailController.text;
                      endereco = enderecoController.text;
                      suporte = suporteSelecionado;

                    });

                    salvarPerfil();

                    Navigator.pop(context);

                  },

                  child: const Text("Salvar"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Perfil"),
        backgroundColor: Colors.teal,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16.0),

        child: Column(

          children: [

            const SizedBox(height: 20),

            GestureDetector(

              onTap: selecionarImagem,

              child: CircleAvatar(

                radius: 60,

                backgroundColor: Colors.teal,

                backgroundImage:
                    imagemPerfil != null
                        ? FileImage(imagemPerfil!)
                        : const NetworkImage(
                            "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANoAAACxCAMAAACV8FNwAAAAA1BMVEX///+nxBvIAAAAPElEQVR4nO3BMQEAAADCoPVPbQhfoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADgMpdrAAE0d+CTAAAAAElFTkSuQmCC",
                          ) as ImageProvider,

                child: const Align(

                  alignment: Alignment.bottomRight,

                  child: CircleAvatar(

                    radius: 18,

                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              nome,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              idade,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            _buildInfoCard(
              Icons.person,
              "Nível de suporte",
              suporte,
            ),

            const SizedBox(height: 12),

            _buildInfoCard(
              Icons.phone,
              "SOS",
              telefone,
              color: Colors.red,
            ),

            const SizedBox(height: 12),

            _buildInfoCard(
              Icons.email,
              "Email",
              email,
            ),

            const SizedBox(height: 12),

            _buildInfoCard(
              Icons.location_on,
              "Endereço",
              endereco,
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(

              onPressed: editarPerfil,

              icon: const Icon(Icons.edit),

              label: const Text("Editar Perfil"),

              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    IconData icon,
    String titulo,
    String valor, {
    Color? color,
  }) {

    return Card(

      elevation: 3,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(

        leading: Icon(
          icon,
          color: color ?? Colors.teal,
          size: 30,
        ),

        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        subtitle: Text(
          valor,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}