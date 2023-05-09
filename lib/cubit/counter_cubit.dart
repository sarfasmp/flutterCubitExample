import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(InitialState());

  void onStateChangeToLoading() async {
    emit(HomePageLoadingState());
    await Future.delayed(
        const Duration(
          seconds: 5,
        ), () {
      list = updatedList;
      emit(StudentListLoadedState(list: list, a: a));
    });
  }

  int a = 0;
  void onIncrement() {
    a++;



    if(state is StudentListLoadedState){
      var val= state as StudentListLoadedState;
      emit(val.copyWith(id: a));
    }

  }

  List<Student> list = [];

  List<Student> updatedList = [
    Student(addNumber: 100, classNumber: "10", name: "SARFAS"),
    Student(addNumber: 100, classNumber: "10", name: "SALIMA"),
    Student(addNumber: 100, classNumber: "10", name: "MInshad"),
    Student(addNumber: 100, classNumber: "10", name: "Shaheen"),
    Student(addNumber: 100, classNumber: "10", name: "shefeeq"),
    Student(addNumber: 100, classNumber: "10", name: "labeeb"),
    Student(addNumber: 100, classNumber: "10", name: "Shinas"),
  ];
}

class Student {
  int? addNumber;
  String? name;
  String? classNumber;

  Student({this.addNumber, this.name, this.classNumber});
}
