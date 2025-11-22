import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';
import 'map_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: DrawerMenu(),
      body: MapScreen(),
    );
  }
}
