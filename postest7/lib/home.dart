import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest7/feedback.dart';
import 'package:postest7/mainpage.dart';
import 'package:postest7/third.dart';

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
                      return MainPage();
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
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.pages_outlined),
              title: Text("Feedback"),
              tileColor: Color.fromARGB(255, 236, 219, 60),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Feed()),
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
                child: Column(
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SnackBar()),
                          );
                        },
                        child: Text("DETAIL HELM"),
                      ),
                    ),
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

// SNACKBAR

class SnackBar extends StatelessWidget {
  const SnackBar({Key? key}) : super(key: key);

  Future<dynamic> CustomAlert(BuildContext context, String PopUp) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 46, 42, 42),
          actions: [
            Column(
              children: [
                Text(
                  PopUp,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 190, 22, 22),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SnackBar()),
                      );
                    },
                    child: Text(
                      "Lanjut",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 190, 22, 22),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text(
                      "Tidak",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Helm"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(12.0),
          padding: EdgeInsets.all(10.0),
          child: Column(children: <Widget>[
            Image.asset("assets/helm1.png",
                width: 200, height: 200, fit: BoxFit.cover),
            Text(
                "\n\n\n Di Tahun 1958 Eitaro asal Jepang, membuat perusahaan helm SHOEI, dan menjadi produsen helm terbsar dam terkenal di dunia hingga saat ini\n"),
            Text(
                "Menggunakan bahan dasar fiberglass, SHOEI membuat berfungsi berbagai macam pilihan\n"),
            Text(
                "Helm berbahan dasar fiberglass ini di akui menjadi helm terbaik yang mengunggulkan keamanan dan performa dalam berkendara.\n\n\n,"),
            ElevatedButton(
              onPressed: () {
                CustomAlert(context, "Tetap Baca?");
              },
              child: Text("Lanjut Baca?"),
            ),
          ]),
        ),
      ),
    );
  }
}
