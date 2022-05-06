import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class form extends StatefulWidget {
  void Function(String, DateTime) onSubmit;

  form(this.onSubmit);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final _controller = TextEditingController();
  DateTime _dataSelecionada = DateTime.now();

  _submitForm() {
    final titulo = _controller.text;

    if (titulo.isEmpty) {
      return;
    }

    widget.onSubmit(titulo, _dataSelecionada);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2023))
        .then((pickeDate) {
      if (pickeDate == null) {
        return;
      }
      setState(() {
        _dataSelecionada = pickeDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: _controller,
        decoration: InputDecoration(labelText: 'Tarefa'),
      ),
      Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Data selecionada ${DateFormat('dd/MM/y').format(_dataSelecionada)}'
              )
            ),
            TextButton(
              onPressed: _showDatePicker,
              child: Text('Selecionar data')
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: _submitForm,
          child: Text('Confirmar'),
        ),
      )
    ]);
  }
}
