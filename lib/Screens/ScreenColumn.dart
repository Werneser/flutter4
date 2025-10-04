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

  Future<void> _addItem() async {
    final String? newName = await _showNameInputDialog(context);
    setState(() {
      final String name = (newName == null || newName.trim().isEmpty)
          ? 'Дополнительный документ номер ${_counter++}'
          : newName.trim();
      _items.add(name);
    });
  }

  void _removeItem(int index) {
    setState(() {
      if (index >= 0 && index < _items.length) _items.removeAt(index);
    });
  }

  Future<String?> _showNameInputDialog(BuildContext context) async {
    final TextEditingController controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Введите имя файла документа'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Например: Заявление на госуслуги',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
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