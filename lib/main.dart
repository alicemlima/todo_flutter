import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:todo/models/tarefa.dart';

import 'components/form.dart';
import 'components/lista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _novaTarefa(String titulo, DateTime data) {
    Tarefa novaTarefa = Tarefa(
        id: Random().nextInt(9999).toString(), titulo: titulo, data: data);
    setState(() {
      _tarefas.add(novaTarefa);
    });
  }

  List<Tarefa> _tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            form(_novaTarefa),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[lista(_tarefas)],
            )
          ],
        ),
      ),
    );
  }
}
