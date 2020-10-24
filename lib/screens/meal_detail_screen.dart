import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final String id;

  MealDetailScreen(@required this.id);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }

  Widget buildContinar(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: id,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContinar(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContinar(
              ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${index + 1}'),
                            ),
                            title: Text(
                              selectedMeal.steps[index],
                            ),
                          ),
                          Divider()
                        ],
                      ),
                  itemCount: selectedMeal.steps.length),
            )
          ],
        ),
      ),
    );
  }
}
