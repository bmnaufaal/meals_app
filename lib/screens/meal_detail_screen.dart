import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';

import '../models/meal.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded
                      ? 'Meal added as a favorite'
                      : 'Meal removed from favorites'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(
                    begin: 0.5,
                    end: 1.0,
                  ).animate(animation),
                  child: child,
                );
              },
              duration: const Duration(
                milliseconds: 300,
              ),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Ingridients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            for (final ingridient in meal.ingredients)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  ingridient,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            const SizedBox(height: 14),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            for (final step in meal.steps)
              Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
