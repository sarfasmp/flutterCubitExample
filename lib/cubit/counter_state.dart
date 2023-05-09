part of 'counter_cubit.dart';

@immutable
abstract class CounterState extends Equatable {}

class InitialState extends CounterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class HomePageLoadingState extends CounterState {
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class StudentListLoadedState extends CounterState {

  int? a;
  List<Student>? list;

  StudentListLoadedState({this.list,this.a});


  StudentListLoadedState copyWith({
    int? id, List<Student>? header,
  }) => StudentListLoadedState(
      a: id ?? a,
      list: header ?? list
  );

  @override
  // TODO: implement props
  List<Object?> get props => [list,a];


}



















