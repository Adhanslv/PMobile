import 'package:flutter/material.dart';

void main() => runApp(halaman());

class halaman extends StatelessWidget {
  const halaman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "2009106145",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.dehaze_outlined),
            color: Colors.white,
            iconSize: 25,
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 16, 103, 185),
          title: Text("Asyhab Ramadhan"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 25,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              iconSize: 25,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.chat_outlined),
              iconSize: 25,
              onPressed: () {},
            ),
          ]),
      body: Container(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(children: <Widget>[
              Image.asset("assets/helm1.png",
                  width: 200, height: 200, fit: BoxFit.cover),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(234, 1, 3, 3)),
                onPressed: () {},
                child: Text("Beli Helm"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
