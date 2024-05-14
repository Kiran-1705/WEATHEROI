import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatheroi/services/location_provider.dart';
import 'screens/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'weatheroi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ScreenHome(),
      ),
    );
  }
}
