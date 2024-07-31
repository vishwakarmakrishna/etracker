import 'package:etracker/models/item.dart';
import 'package:etracker/widgets/item_form.dart';
import 'package:flutter/material.dart';
import 'package:etracker/widgets/item_list.dart';
import '../widgets/size_reporter.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeReporter(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Item Tracker'),
        ),
        body: const ItemList(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog<Item?>(
              context: context,
              builder: (BuildContext context) => const Dialog(
                child: ItemForm(),
              ),
            );
          },
          label: const Text('Add'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
