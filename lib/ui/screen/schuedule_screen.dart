import 'package:flutter/material.dart';

import '../widgets/schuedule_item.dart';

class SchueduleScreen extends StatefulWidget {
  const SchueduleScreen({super.key});

  @override
  State<SchueduleScreen> createState() => _SchueduleScreenState();
}

class _SchueduleScreenState extends State<SchueduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          width: 1000,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: 10,
            itemBuilder: (context, index) => const SchueduleItem(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          ),
        ),
      );
  }
}