import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      padding: const EdgeInsets.all(20),

      child: Column(

        children: [

          const CircleAvatar(

            radius: 60,
            backgroundColor: Colors.blue,

            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 70,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Usuário",

            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          perfilItem(
            Icons.email,
            "Email",
            "usuario@email.com",
          ),

          perfilItem(
            Icons.phone,
            "Telefone",
            "(11) 99999-9999",
          ),

          perfilItem(
            Icons.location_on,
            "Cidade",
            "São Paulo",
          ),

          const SizedBox(height: 30),

          const Align(
            alignment: Alignment.centerLeft,

            child: Text(
              "Contato de Emergência",

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),

          const SizedBox(height: 20),

          emergenciaCard(
            "Mãe",
            "(11) 98888-7777",
            Icons.call,
          ),

          emergenciaCard(
            "SAMU",
            "192",
            Icons.local_hospital,
          ),

          emergenciaCard(
            "Bombeiros",
            "193",
            Icons.fire_truck,
          ),
        ],
      ),
    );
  }

  Widget perfilItem(
    IconData icone,
    String titulo,
    String descricao,
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

          Icon(
            icone,
            color: Colors.blue,
            size: 30,
          ),

          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                titulo,

                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                descricao,

                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget emergenciaCard(
    String nome,
    String numero,
    IconData icone,
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
            backgroundColor: Colors.red,

            child: Icon(
              icone,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 20),

          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  nome,

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  numero,

                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          IconButton(

            onPressed: () {},

            icon: const Icon(
              Icons.phone,
              color: Colors.green,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}