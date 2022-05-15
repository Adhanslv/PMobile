import 'package:flutter/material.dart';
import 'package:postest3/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Jenis { unknown, sizedL, sizedM, sizedXL }

class _MyHomePageState extends State<MyHomePage> {
  int angka = 0;
  bool pilihan = false;
  Jenis? jenis = Jenis.unknown;
  String namaDepan = "", namaBelakang = "", deskripsi = "";
  final ctrlNamaDepan = TextEditingController();
  final ctrlNamaBelakang = TextEditingController();
  final ctrlDeskripsi = TextEditingController();

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ctrlNamaDepan.dispose();
    ctrlNamaBelakang.dispose();
    ctrlDeskripsi.dispose();
    super.dispose();
  }

  String getJenis(Jenis? value) {
    if (value == Jenis.sizedL) {
      return "Size l";
    } else if (value == Jenis.sizedM) {
      return "Size M";
    } else if (value == Jenis.sizedXL) {
      return "Size Xl";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            color: Colors.white,
            iconSize: 25,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Home();
              }));
            }),
        centerTitle: true,
        title: Text("Order Helm"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Column(
            children: [
              Text("Nama        : $namaDepan "),
              Text("Merk Helm : $namaBelakang"),
              Text("Deskripsi   : $deskripsi"),
              Text("Status? ${!pilihan ? "Jadi Beli" : "Tidak Beli"}"),
              Text("Sized  ${getJenis(jenis)}"),
              TextField(
                controller: ctrlNamaDepan,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama Anda",
                  hintText: "Nama Anda",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: ctrlNamaBelakang,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Merk Helm",
                  hintText: "Merk Helm",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLines: 4,
                controller: ctrlDeskripsi,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Deskripsi",
                  hintText: "Isi Deskripsi",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    namaDepan = ctrlNamaDepan.text;
                    namaBelakang = ctrlNamaBelakang.text;
                    deskripsi = ctrlDeskripsi.text;
                  });
                },
                child: Text("Tampilkan "),
              ),
              ListTile(
                title: Text("Anda Mau Beli?"),
                leading: Checkbox(
                  value: pilihan,
                  onChanged: (bool? value) {
                    setState(() {
                      pilihan = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Size L"),
                leading: Radio(
                  groupValue: jenis,
                  value: Jenis.sizedL,
                  onChanged: (Jenis? value) {
                    setState(() {
                      jenis = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Size M"),
                leading: Radio(
                  groupValue: jenis,
                  value: Jenis.sizedM,
                  onChanged: (Jenis? value) {
                    setState(() {
                      jenis = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Size M"),
                leading: Radio(
                  groupValue: jenis,
                  value: Jenis.sizedXL,
                  onChanged: (Jenis? value) {
                    setState(() {
                      jenis = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
