import 'package:etracker/models/item.dart';
import 'package:etracker/providers/item_provider.dart';
import 'package:etracker/widgets/item_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = context.watch<ItemProvider>();
    final items = itemProvider.items;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  showDialog<Item?>(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      child: ItemForm(
                        item: item,
                      ),
                    ),
                  );
                  // TODO: Implement edit functionality
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  itemProvider.removeItem(item.id);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
