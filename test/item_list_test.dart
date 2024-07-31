import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:etracker/providers/item_provider.dart';
import 'package:etracker/widgets/item_list.dart';

void main() {
  testWidgets('ItemList displays items correctly', (WidgetTester tester) async {
    final provider = ItemProvider();
    provider.addItem('Test Item 1', 'Description 1');
    provider.addItem('Test Item 2', 'Description 2');

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: provider,
          child: const Scaffold(body: ItemList()),
        ),
      ),
    );

    expect(find.text('Test Item 1'), findsOneWidget);
    expect(find.text('Description 1'), findsOneWidget);
    expect(find.text('Test Item 2'), findsOneWidget);
    expect(find.text('Description 2'), findsOneWidget);
  });
}
