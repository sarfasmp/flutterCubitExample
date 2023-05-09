import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      counterCubit.onStateChangeToLoading();
    });
  }

  late CounterCubit counterCubit;

  @override
  Widget build(BuildContext context) {
    counterCubit = BlocProvider.of<CounterCubit>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(floatingActionButton: FloatingActionButton(
      onPressed: () {
        counterCubit.onIncrement();
      },
    ), body: BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        if (state is HomePageLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if(state is StudentListLoadedState) {
          return Column(
            children: [
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                buildWhen: (CounterState, S) {
                  return true;
                },
                builder: (context, state) {
                  state as StudentListLoadedState;
                  return Container(
                    width: double.infinity,
                    height: size.width / 3,
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        state.a.toString(),
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  );
                },
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is StudentListLoadedState) {
                    return Expanded(
                        child: ListView(
                      children: (state.list ?? [])
                          .map(
                            (e) => ListTile(
                              title: Text(e.name ?? ""),
                            ),
                          )
                          .toList(),
                    ));
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          );
        }else{
          return const Text("Something went wrong");
        }
      },
    ));
  }
}

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// // Define the state of the page
// class PageState extends Equatable {
//   final int counter;
//   final String message;
//
//   PageState({required this.counter, required this.message});
//
//   @override
//   List<Object?> get props => [counter, message];
//
//   // Create a copy of the state with the counter updated
//   PageState copyWithCounter(int newCounter) {
//     return PageState(
//       counter: newCounter,
//       message: this.message,
//     );
//   }
//
//   // Create a copy of the state with the message updated
//   PageState copyWithMessage(String newMessage) {
//     return PageState(
//       counter: this.counter,
//       message: newMessage,
//     );
//   }
// }
//
// // Define the Cubit for the page state
// class PageCubit extends Cubit<PageState> {
//   PageCubit() : super(PageState(counter: 0, message: ''));
//
//   // Handle incrementing the counter
//   void incrementCounter() {
//     emit(state.copyWithCounter(state.counter + 1));
//   }
//
//   // Handle changing the message
//   void changeMessage(String newMessage) {
//     emit(state.copyWithMessage(newMessage));
//   }
// }
//
// // In your Flutter widget
// class MyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<PageCubit, PageState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               // Display the counter and button to increment it
//               Text('Counter: ${state.counter}'),
//               ElevatedButton(
//                 onPressed: () {
//                   // Call the Cubit method to increment the counter
//                   context.read<PageCubit>().incrementCounter();
//                 },
//                 child: Text('Increment Counter'),
//               ),
//
//               // Display the message and text field to change it
//               Text('Message: ${state.message}'),
//               TextField(
//                 onChanged: (newValue) {
//                   // Call the Cubit method to change the message
//                   context.read<PageCubit>().changeMessage(newValue);
//                 },
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
