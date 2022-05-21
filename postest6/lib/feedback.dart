import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest6/home.dart';

void main() {
  runApp(const Feed());
}

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Feedback(),
    );
  }
}

// cekBox
class checkBoxController extends GetxController {
  var puas = false.obs;
}

// text_ctrl
class TextController extends GetxController {
  var namaAnda = "".obs;
  var deskripsi = "".obs;
  final namaDepanCtrl = TextEditingController();
  final deskAndaCtrl = TextEditingController();

  onPressed() {
    namaAnda = namaDepanCtrl.text.obs;
    deskripsi = deskAndaCtrl.text.obs;
  }
}

class Feedback extends StatelessWidget {
  Feedback({Key? key}) : super(key: key);

  final TextController textCtrl = Get.put(TextController());
  final TextController deskripsiCtrl = Get.put(TextController());
  final checkBoxController cbCtrl = Get.put(checkBoxController());

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
        title: Text(
          "Feedback",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(18.0),
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  controller: textCtrl.namaDepanCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama Anda",
                    hintText: "Isi Nama Anda",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLines: 4,
                controller: deskripsiCtrl.deskAndaCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Deskripsi",
                  hintText: "Isi Deskripsi",
                ),
              ),
              ListTile(
                title: Text("Puas?"),
                leading: Obx(
                  () => Checkbox(
                    value: cbCtrl.puas.value,
                    onChanged: (Value) {
                      cbCtrl.puas(Value);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: textCtrl.onPressed, child: Text("Submit")),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Output()));
                  },
                  child: Text("Cek Data Anda !"))
            ],
          ),
        ],
      ),
    );
  }
}

class Output extends StatelessWidget {
  Output({Key? key}) : super(key: key);

  final TextController textCtrl = Get.find();
  final TextController deskripSiCtrl = Get.find();
  final checkBoxController cbCtrl = Get.put(checkBoxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feedback",
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                "Nama Saya : ${textCtrl.namaAnda.value}",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Deskripsi : ${deskripSiCtrl.deskripsi.value}",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Dan Saya ${cbCtrl.puas.value ? 'Puas' : 'Tidak Puas'}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
