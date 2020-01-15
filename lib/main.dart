import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_api/telas/Biblioteca.dart';
import 'package:youtube_api/telas/EmAlta.dart';
import 'package:youtube_api/telas/Inicio.dart';
import 'package:youtube_api/telas/Inscricoes.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/logo.png",
          width: 96,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("Videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Pesquisa");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("Conta");
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[telas[_indiceAtual]],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
//        backgroundColor: Colors.red,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.green,
            title: Text("Inicio"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.black,
              title: Text("Em alta"),
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              // backgroundColor: Colors.yellow,
              title: Text("Inscrições"),
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.red,
              title: Text("Biblioteca"),
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
