import 'package:flutter/material.dart';
import 'package:recipe/recipes.dart';

import 'ingredient.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key, required this.recipe});
  final Recipes recipe;

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {

int _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        centerTitle: true,
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              widget.recipe.imageURL,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            Text(widget.recipe.label),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount: widget.recipe.ingredients.length,
                    itemBuilder: (context, index){
                      final ingredients = widget.recipe.ingredients[index];
                      return Text("${ingredients.quantity * _sliderValue} ${ingredients.measure} ${ingredients.name}");
                },
              ),
            ),
            ),
            Slider(
                min: 1,
                max: 10,
                value: _sliderValue.toDouble(),
                label: "$_sliderValue Servings",
                divisions: 9,
            onChanged: (newValue){
                  print(newValue);
                  setState(() {
                    _sliderValue = newValue.toInt();
                  });

            },
              activeColor: Colors.green,
              inactiveColor: Colors.black
          )

        ],
        ),
      ),
    );

  }
}
