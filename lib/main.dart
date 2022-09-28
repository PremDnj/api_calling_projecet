import 'package:flutter/material.dart';
import './presentation/home_screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'ApiCallback',
    theme: ThemeData(primarySwatch: Colors.purple),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('ApiCallback'),
      ),
      body: HomeScreen(),
    ),
  ));
}
