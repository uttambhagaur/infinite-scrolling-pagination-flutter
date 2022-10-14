import 'package:flutter/material.dart';
import 'package:infinite_scrolling_pagination_flutter/screens.dart/home_page.dart';
import 'package:infinite_scrolling_pagination_flutter/states/post_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<PostState>(
    create: (_) => PostState(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Infinite Posts',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
