import 'package:flutter/material.dart';

class BotaoFrase extends StatelessWidget {

  final String texto;
  final IconData icone;
  final Color cor;

  const BotaoFrase({
    super.key,
    required this.texto,
    required this.icone,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(

        color: cor,

        borderRadius: BorderRadius.circular(25),

        border: Border.all(
          color: Colors.white,
          width: 5,
        ),

        boxShadow: const [

          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),

      child: Material(

        color: Colors.transparent,

        child: InkWell(

          borderRadius: BorderRadius.circular(25),

          onTap: () {

            ScaffoldMessenger.of(context).showSnackBar(

              SnackBar(
                content: Text(texto),
              ),
            );
          },

          child: Padding(

            padding: const EdgeInsets.all(10),

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Icon(
                  icone,
                  color: Colors.white,
                  size: 65,
                ),

                const SizedBox(height: 15),

                Text(
                  texto,

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
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