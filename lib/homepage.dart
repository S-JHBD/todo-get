import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List todos = <dynamic>[];
  @override
  void initState(){
    super.initState();
    getTodo();
  }

  getTodo() async{
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var response = await http.get(Uri.parse(url));

    setState(() {
      todos = convert.jsonDecode(response.body) as List<dynamic>;
    }
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
          itemBuilder: (context, index){
          return ExpansionTile(
              title: Text(todos[index]['title']),
            children: [
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  Text('title: ${todos[index]['title']}')
                ],
              )
            ],
          );
          }
      )
    );
  }
}
