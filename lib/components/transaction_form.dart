import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm(this.onSubmit, {super.key});

  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  final void Function(String, double) onSubmit;

  void _onSubmitForm() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleControler,
              decoration: InputDecoration(labelText: 'Título'),
              onSubmitted: (_) => _onSubmitForm(),
            ),
            TextField(
              controller: valueControler,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              keyboardType: .numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSubmitForm(),
            ),
            Row(
              mainAxisAlignment: .end,
              children: [
                TextButton(
                  onPressed: _onSubmitForm,
                  style: TextButton.styleFrom(foregroundColor: Colors.purple),
                  child: Text('Nova Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
