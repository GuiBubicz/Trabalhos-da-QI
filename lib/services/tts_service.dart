import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  static final FlutterTts _tts = FlutterTts();

  static Future falar(String texto) async {
    await _tts.setLanguage('pt-BR');
    await _tts.setSpeechRate(0.9);
    await _tts.speak(texto);
  }
}