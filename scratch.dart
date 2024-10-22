import 'dart:io';

void main() {
  performTasks();
}

Future<void> performTasks()  async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration seconds = Duration(seconds: 3);
  late String result;
  await Future.delayed(seconds,(){
    result = 'task 2 data';
  }
  );
  return result;
  }


void task3(String task) {
  String result = 'task 3 data';
  print('$task is arrived and now is $result');
}