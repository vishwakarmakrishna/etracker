import 'package:etracker/providers/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/item_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemProvider>(
          create: (context) => ItemProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Item Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ItemListScreen(),
      ),
    );
  }
}
