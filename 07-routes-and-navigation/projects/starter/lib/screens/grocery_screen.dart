import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../di/providers.dart';
import 'screens.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read(groceryManagerProvider).createNewItem();
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer(
      builder: (context, watch, child) {
        final groceryManager = watch(groceryManagerProvider);

        if (groceryManager.groceryItems.isNotEmpty) {
          return GroceryListScreen();
        } else {
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
