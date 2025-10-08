import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cursor_demo/features/counter/data/counter_local_datasource.dart';
import 'package:cursor_demo/features/counter/data/counter_repository_impl.dart';
import 'package:cursor_demo/features/counter/domain/decrement_counter_usecase.dart';
import 'package:cursor_demo/features/counter/domain/increment_counter_usecase.dart';
import 'package:cursor_demo/features/counter/presentation/counter_bloc.dart';
import 'package:cursor_demo/features/counter/presentation/counter_page.dart';
import 'package:cursor_demo/uikit/app_themes.dart';
import 'package:cursor_demo/uikit/theme_provider.dart';

void main() {
  final counterLocalDataSource = CounterLocalDataSource();
  final counterRepository = CounterRepositoryImpl(counterLocalDataSource);
  final incrementCounterUseCase = IncrementCounterUseCase(counterRepository);
  final decrementCounterUseCase = DecrementCounterUseCase(counterRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(incrementCounterUseCase, decrementCounterUseCase)..add(CounterStarted()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeProvider.themeMode,
          home: const CounterPage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
