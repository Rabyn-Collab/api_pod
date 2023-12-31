import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/models/todo.dart';

class A {
  final String g;
  A(this.g);
}

class B extends A{
  B(super.g);

}


final todoProvider = StateNotifierProvider<TodoProvider, List<Todo>>((ref) =>TodoProvider([
  Todo(dateTime: DateTime.now().toString(), todo: 'Reading a book')
]));

class TodoProvider extends StateNotifier<List<Todo>>{
  TodoProvider(super.state);

  void add (Todo todo){
     state = [...state, todo];
  }

  void remove(Todo todo){
    state.remove(todo);
    state = [...state];
  }

  void update(Todo newTodo){
     state = [
       for(final tod in state) tod.dateTime == newTodo.dateTime ? newTodo: tod
     ];
  }


}