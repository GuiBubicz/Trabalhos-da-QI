import 'package:flutter/material.dart';

class ComunicadosPage extends StatelessWidget {
  const ComunicadosPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(

      padding: const EdgeInsets.all(20),

      children: [

        comunicadoCard(
          "Consulta médica",
          "Você possui consulta amanhã às 14h.",
          Icons.calendar_month,
          Colors.blue,
        ),

        comunicadoCard(
          "Remédio",
          "Horário do medicamento às 18h.",
          Icons.medication,
          Colors.red,
        ),

        comunicadoCard(
          "Família",
          "Sua família enviou uma mensagem.",
          Icons.family_restroom,
          Colors.green,
        ),
      ],
    );
  }

  Widget comunicadoCard(
    String titulo,
    String descricao,
    IconData icone,
    Color cor,
  ) {

    return Container(

      margin: const EdgeInsets.only(bottom: 20),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(

        children: [

          CircleAvatar(
            radius: 30,
            backgroundColor: cor,

            child: Icon(
              icone,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(width: 20),

          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  titulo,

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  descricao,

                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}