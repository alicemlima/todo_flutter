import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todo/models/tarefa.dart';

class lista extends StatelessWidget {
  List<Tarefa> _lista;
  lista(this._lista);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: _lista.length,
          itemBuilder: (context, index) {
            final tarefa = _lista[index];
            return Card(
                child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: tarefa.data.day >= DateTime.now().day
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(DateFormat('d MMM y').format(tarefa.data),
                        style: TextStyle(
                            color: tarefa.data.day >= DateTime.now().day
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary)))
              ],
            ));
          }),
    );
  }
}
