import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/frase_model.dart';

class FraseFormPage extends StatefulWidget {
  final FraseModel? frase;
  final VoidCallback onSave;

  const FraseFormPage({super.key, this.frase, required this.onSave});

  @override
  State<FraseFormPage> createState() => _FraseFormPageState();
}

class _FraseFormPageState extends State<FraseFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _dbHelper = DatabaseHelper();

  late TextEditingController _textoController;

  IconData _iconeSelecionado = Icons.help_outline;
  Color _corSelecionada = Colors.blue;

  final List<IconData> icones = [
    Icons.local_drink, Icons.sentiment_dissatisfied, Icons.wc, Icons.sos,
    Icons.restaurant, Icons.home, Icons.phone, Icons.bed, Icons.directions_car,
    Icons.favorite, Icons.warning, Icons.medical_services,
  ];

  final List<Color> cores = [
    Colors.blue, Colors.red, Colors.green, Colors.orange, Colors.purple,
    Colors.teal, Colors.pink, Colors.indigo, Colors.amber,
  ];

  @override
  void initState() {
    super.initState();
    _textoController = TextEditingController(text: widget.frase?.texto);
    if (widget.frase != null) {
    _iconeSelecionado = IconData(
    //ignore: non_const_argument_for_const_parameter
    widget.frase!.icone,
    fontFamily: 'MaterialIcons',
  );

_corSelecionada = Color(
  widget.frase!.cor,
);
    }
  }

  @override
  void dispose() {
    _textoController.dispose();
    super.dispose();
  }

  Future<void> _salvar() async {

  try {

    print('CLICOU EM SALVAR');

    if (!_formKey.currentState!.validate()) return;

    final novaFrase = FraseModel(
      id: widget.frase?.id,
      texto: _textoController.text.trim(),
      icone: _iconeSelecionado.codePoint,
      cor: _corSelecionada.value,
    );

    print(novaFrase.texto);

    if (widget.frase == null) {

      final id = await _dbHelper.inserirFrase(novaFrase);

      print('SALVOU ID: $id');

    } else {

      await _dbHelper.atualizarFrase(novaFrase);

      print('FRASE ATUALIZADA');
    }

    widget.onSave();

    Navigator.pop(context, true);

  } catch (e) {

    print('ERRO SQLITE: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.frase == null ? 'Nova Frase' : 'Editar Frase'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _textoController,
                  decoration: const InputDecoration(
                    labelText: 'Texto da frase',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? 'Digite a frase' : null,
                ),
                const SizedBox(height: 20),
                const Text("Ícone", style: TextStyle(fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: icones.map((icon) {
                    bool selected = icon == _iconeSelecionado;
                    return GestureDetector(
                      onTap: () => setState(() => _iconeSelecionado = icon),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: selected ? Colors.teal : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(icon, size: 40, color: selected ? Colors.white : Colors.black),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const Text("Cor", style: TextStyle(fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: cores.map((color) {
                    bool selected = color == _corSelecionada;
                    return GestureDetector(
                      onTap: () => setState(() => _corSelecionada = color),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: selected ? Border.all(color: Colors.black, width: 3) : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _salvar,
                    child: Text(widget.frase == null ? "Adicionar Frase" : "Salvar Alterações"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}