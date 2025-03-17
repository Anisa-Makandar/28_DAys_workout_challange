import 'package:health_gym_project_altamash/models/exercise_historymodel.dart';

abstract class FavouritesEvent {}

class AddFavouritesEvent extends FavouritesEvent {
  FavouriteExercisesModel exercises;
  AddFavouritesEvent({required this.exercises});
}

class DeleteFavouritesEvent extends FavouritesEvent {
  int id;
  DeleteFavouritesEvent({required this.id});
}

class GetAllFavouritesEvent extends FavouritesEvent {}

class DeletAllFavouritesEvent extends FavouritesEvent {}
