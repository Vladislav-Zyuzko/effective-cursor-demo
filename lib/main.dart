import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cursor_demo/features/counter/data/counter_local_datasource.dart';
import 'package:cursor_demo/features/counter/data/counter_repository_impl.dart';
import 'package:cursor_demo/features/counter/domain/decrement_counter_usecase.dart';
import 'package:cursor_demo/features/counter/domain/increment_counter_usecase.dart';
import 'package:cursor_demo/features/counter/presentation/counter_page.dart';
import 'package:cursor_demo/features/counter/presentation/counter_viewmodel.dart';

void main() {
  final counterLocalDataSource = CounterLocalDataSource();
  final counterRepository = CounterRepositoryImpl(counterLocalDataSource);
  final incrementCounterUseCase = IncrementCounterUseCase(counterRepository);
  final decrementCounterUseCase = DecrementCounterUseCase(counterRepository);

  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterViewModel(incrementCounterUseCase, decrementCounterUseCase),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterPage(title: 'Flutter Demo Home Page'),
    );
  }
}
