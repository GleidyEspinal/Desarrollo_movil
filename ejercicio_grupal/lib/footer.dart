import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16), // Espaciado alrededor del contenido

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los elementos a lo largo del espacio disponible

        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://hips.hearstapps.com/hmg-prod/images/sandwich-en-rollitos-1674032576.jpg?crop=0.670xw:1.00xh;0.166xw,0&resize=1200:*"),
            radius: 45,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage("https://www.recetasnestle.com.mx/sites/default/files/inline-images/comidas-fritas-plato-apanado-ensalada.jpg"),
            radius: 45,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage("https://www.eltiempo.com/files/article_main_1200/uploads/2022/09/23/632dfe636c65d.jpeg"),
            radius: 45,
          ),
       SizedBox(
        width: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.cake_rounded),
                  Icon(Icons.star_border_outlined),
                  Icon(Icons.music_note),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
