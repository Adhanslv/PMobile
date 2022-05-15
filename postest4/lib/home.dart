import 'package:flutter/material.dart';
import 'package:postest4/mainpage.dart';
import 'package:postest4/third.dart';

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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text("BAR MENU"),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Beli Helm"),
              tileColor: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return MyHomePage();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Main Page"),
              tileColor: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ThirdPage()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 16, 103, 185),
        title: Text("Asyhab Ramadhan"),
      ),
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
