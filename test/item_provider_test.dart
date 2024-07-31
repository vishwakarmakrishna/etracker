import 'package:flutter_test/flutter_test.dart';
import 'package:etracker/providers/item_provider.dart';

void main() {
  group('ItemProvider', () {
    test('should add an item', () {
      final provider = ItemProvider();
      provider.addItem('Test Item', 'Test Description');
      expect(provider.items.length, 1);
      expect(provider.items[0].name, 'Test Item');
      expect(provider.items[0].description, 'Test Description');
    });

    test('should remove an item', () {
      final provider = ItemProvider();
      provider.addItem('Test Item', 'Test Description');
      final id = provider.items[0].id;
      provider.removeItem(id);
      expect(provider.items.length, 0);
    });

    test('should edit an item', () {
      final provider = ItemProvider();
      provider.addItem('Test Item', 'Test Description');
      final id = provider.items[0].id;
      provider.editItem(id, 'Updated Item', 'Updated Description');
      expect(provider.items[0].name, 'Updated Item');
      expect(provider.items[0].description, 'Updated Description');
    });
  });
}
