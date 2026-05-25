import 'package:flutter/material.dart';
import 'package:toque_fale/models/frase_model.dart';

class BotaoFrase extends StatelessWidget {

  final String texto;

  final IconData icone;

  final Color cor;

  final VoidCallback onTap;

  final VoidCallback? onLongPress;

  const BotaoFrase({

    super.key,

    required this.texto,

    required this.icone,

    required this.cor,

    required this.onTap,

    this.onLongPress, required FraseModel frase,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      onLongPress: onLongPress,

      child: Container(

        margin: const EdgeInsets.all(8),

        decoration: BoxDecoration(

          color: cor,

          borderRadius:
              BorderRadius.circular(20),
        ),

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(

              icone,

              size: 50,

              color: Colors.white,
            ),

            const SizedBox(height: 12),

            Padding(

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 8,
              ),

              child: Text(

                texto,

                textAlign: TextAlign.center,

                style: const TextStyle(

                  color: Colors.white,

                  fontSize: 20,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}