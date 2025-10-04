import 'package:flutter/material.dart';

class ScreenListView extends StatefulWidget {
  const ScreenListView({Key? key}) : super(key: key);

  @override
  _ScreenListViewState createState() => _ScreenListViewState();
}

class _ScreenListViewState extends State<ScreenListView> {
  final List<String> _items = [
    'Заявление на госуслуги',
    'Копия паспорта',
    'Справка о доходах',
    'Фото паспортного размера',
  ];
  int _counter = 1;

  void _addItem() {
    setState(() {
      _items.add('Дополнительный документ номер ${_counter++}');
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
                'ListView.builder',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return ListTile(
                      title: Text(item),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeItem(index),
                      ),
                    );
                  },
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