import 'package:flutter/material.dart';
import '../models/frase_model.dart';

List<FraseModel> frases = [
  FraseModel(
    texto: "Quero Água",
    icone: Icons.local_drink.codePoint,
    cor: Colors.blue.value,
  ),
  FraseModel(
    texto: "Tenho dor",
    icone: Icons.sentiment_dissatisfied.codePoint,
    cor: Colors.orange.value,
  ),
  FraseModel(
    texto: "Banheiro",
    icone: Icons.wc.codePoint,
    cor: Colors.green.value,
  ),
  FraseModel(
    texto: "Ajuda",
    icone: Icons.sos.codePoint,
    cor: Colors.red.value,
  ),
  FraseModel(
    texto: "Tenho Fome",
    icone: Icons.restaurant.codePoint,
    cor: Colors.orange.shade300.value,
  ),
  FraseModel(
    texto: "Quero ir p/ casa",
    icone: Icons.home.codePoint,
    cor: Colors.purple.value,
  ),
];