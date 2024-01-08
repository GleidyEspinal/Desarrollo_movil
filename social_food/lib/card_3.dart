import 'package:flutter/material.dart';
import 'package:social_food/social_food_theme.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/mag2.png'),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            constraints: const BoxConstraints.expand(
                width: 350,
                height: 450
            ),
            child: Stack(
              children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(16),
                    child: Icon(Icons.book, size: 40.0, color: Colors.white)),

                Positioned(
                  top: 70,
                    left: 10,
                    child: Text("Recipe Trends", style: SocialFoodTheme.darkTextTheme.displayLarge))


              ],
            )
        )
    );
  }
}
