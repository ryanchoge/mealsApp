import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteMealsProvider extends StateNotifier<List<Meal>> {
  FavouriteMealsProvider() : super([]);
  bool toggleMealFavouriteStatus(Meal meal) {
    final mealsFavourite = state.contains(meal);
    if (mealsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteMealsProvider, List<Meal>>((ref) {
  return FavouriteMealsProvider();
});
