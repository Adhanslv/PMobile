import 'package:flutter/material.dart';
import 'package:postest3/mainpage.dart';

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
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }));
              },
            ),
            IconButton(
              icon: Icon(Icons.chat_outlined),
              iconSize: 25,
              onPressed: () {},
            ),
          ]),
      body: Container(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(children: <Widget>[
              Image.asset("assets/helm1.png",
                  width: 200, height: 200, fit: BoxFit.cover),
              Container(
                margin: const EdgeInsets.all(12.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_card_outlined,
                      size: 17,
                      color: Colors.white,
                    ),
                    Text(
                      "Beli Sekarang",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
