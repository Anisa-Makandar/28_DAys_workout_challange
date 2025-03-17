import 'package:bloc/bloc.dart';
import 'package:health_gym_project_altamash/HistroyBloc/history_event.dart';
import 'package:health_gym_project_altamash/workout_databse.dart';

import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, ExerciseHistroyState> {
  DBHelper dbHelper;
  HistoryBloc({required this.dbHelper}) : super(HistoryInitialState()) {
    on<HistoryaddEvenet>((event, emit) async {
      emit(HistoryLoadingState());
      bool check = await dbHelper.addExercise(event.exercises);
      if (check) {
        var data = await dbHelper.getAllExercises();
        emit(HistoryLoadedState(mExercise: data));
      }
    });
    on<HistoryDeleteEvent>((event, emit) async {
      emit(HistoryLoadingState());
      bool check = await dbHelper.deleteExercise(event.id);
      if (check) {
        var data = await dbHelper.getAllExercises();
        emit(HistoryLoadedState(mExercise: data));
      }
    });
    on<AllHistoryDeleteEvent>((event, emit) async {
      emit(HistoryLoadingState());
      bool check = await dbHelper.deleteAllExercises();
      if (check) {
        var data = await dbHelper.getAllExercises();
        emit(HistoryLoadedState(mExercise: data));
      }
    });
    on<GetallhistoryEvent>((event, emit) async {
      emit(HistoryLoadingState());
      var data = await dbHelper.getAllExercises();

      emit(HistoryLoadedState(mExercise: data));
    });
  }
}
