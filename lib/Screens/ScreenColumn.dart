import 'package:flutter/material.dart';

class ScreenColumn extends StatefulWidget {
  const ScreenColumn({Key? key}) : super(key: key);

  @override
  _ScreenColumnState createState() => _ScreenColumnState();
}

class _ScreenColumnState extends State<ScreenColumn> {
  final List<String> _items = [
    'Заявление на госуслуги',
    'Копия паспорта',
    'Справка о доходах',
    'Фото паспортного размера',
  ];
  int _counter = 1;

  void _addItem() {
    setState(() {
      _items.add('Документ ${_counter++} студента');
    });
  }

  void _removeItem(int index) {
    setState(() {
      if (index >= 0 && index < _items.length) _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Column (через SingleChildScrollView)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 240,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(_items.length, (idx) {
                      final item = _items[idx];
                      return ListTile(
                        title: Text(item),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _removeItem(idx),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: _addItem,
                  icon: const Icon(Icons.add),
                  label: const Text('Добавить элемент'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}