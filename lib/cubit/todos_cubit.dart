import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/models/states/todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosState());
}
