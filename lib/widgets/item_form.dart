import 'package:etracker/models/item.dart';
import 'package:etracker/providers/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({super.key, this.item});
  final Item? item;
  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late ItemProvider itemProvider;
  late final TextEditingController _descriptionController;
  @override
  void initState() {
    if (widget.item != null) {
      _nameController = TextEditingController(text: widget.item?.name);
      _descriptionController =
          TextEditingController(text: widget.item?.description);
    } else {
      _nameController = TextEditingController();
      _descriptionController = TextEditingController();
    }
    itemProvider = Provider.of<ItemProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.item == null ? 'Add' : 'Edit'} Item Form",
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (widget.item != null) {
                    itemProvider.editItem(
                      widget.item!.id,
                      _nameController.text,
                      _descriptionController.text,
                    );
                    _nameController.clear();
                    _descriptionController.clear();
                  } else {
                    itemProvider.addItem(
                      _nameController.text,
                      _descriptionController.text,
                    );

                    _nameController.clear();
                    _descriptionController.clear();
                  }
                }
                Navigator.of(context).pop();
              },
              child: Text('${widget.item == null ? 'Add' : 'Edit'} Item'),
            ),
          ],
        ),
      ),
    );
  }
}
