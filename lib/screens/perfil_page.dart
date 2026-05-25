import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage("https://m.media-amazon.com/images/S/pv-target-images/5f8fc8513b01c2ac19accaada71fc068f4ca875b001ebd0f98afac5bf37b5b5d._SX1080_FMjpg_.jpg"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Shaun Murphy",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Text("19 anos", style: TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(height: 30),

            _buildInfoCard(Icons.person, "Nível de suporte", "Nível 1"),
            const SizedBox(height: 12),
            _buildInfoCard(Icons.phone, "SOS", "51999416-7998", color: Colors.red),
            const SizedBox(height: 12),
            _buildInfoCard(Icons.email, "Email", "qitarde1245@gmail.com"),
            const SizedBox(height: 12),
            _buildInfoCard(Icons.location_on, "Endereço", "Assis Brasil, 666"),

            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {},
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

  Widget _buildInfoCard(IconData icon, String titulo, String valor, {Color? color}) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: color ?? Colors.teal, size: 30),
        title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(valor, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}