import 'package:flutter/material.dart';

class ComunicadosPage extends StatelessWidget {
  const ComunicadosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Comunicados",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildComunicadoCard(
                    nome: "Mãe",
                    mensagem: "A comida está pronta.",
                    horario: "09:13",
                    imagem: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxIEAtoj0BFxg_egIdK8hbTYH6UDZSeiq30g&s", // imagem exemplo
                  ),
                  const SizedBox(height: 12),
                  _buildComunicadoCard(
                    nome: "Medica",
                    mensagem: "Sua consulta está marcada para amanhã.",
                    horario: "09:12",
                    imagem: "https://m.media-amazon.com/images/S/pv-target-images/440c8b6272b630caa0714332668e03b3de99082e6ea668aa3dd67b4f72039c2a.png",
                  ),
                  const SizedBox(height: 12),
                  _buildComunicadoCard(
                    nome: "Diretora Do Hospital",
                    mensagem: "Amanha Tem Reunião às 14h.",
                    horario: "Agora",
                    imagem: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFNx3WpSxB_W5_vmGlactTMQ4lfqJpcP9WJw&s",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Nova mensagem (em desenvolvimento)")),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildComunicadoCard({
    required String nome,
    required String mensagem,
    required String horario,
    required String imagem,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imagem),
          radius: 28,
        ),
        title: Text(nome, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(mensagem),
        trailing: Text(horario, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}