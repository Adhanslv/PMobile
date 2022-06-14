import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:postest7/TodoPage.dart';
import 'package:postest7/controllers/CrudController.dart';
import 'package:postest7/controllers/FirestoreController.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final FirestoreController fsc = Get.put(FirestoreController());
  final CrudController crudController = Get.put(CrudController());

  Widget builder(context, snapshot) {
    return (snapshot.hasData)
        ? Column(
            children: snapshot.data!.docs
                .map<Widget>(
                  (e) => MyListTile(
                    namaText: e.get('nama'),
                    merkText: e.get("merk"),
                    sizeText: e.get("size"),
                    deskripsi: e.get('deskripsi').toString(),
                    onTap: () {
                      crudController.id(e.id);
                      crudController.nama(e.get('nama'));
                      crudController.merk(e.get('merk'));
                      crudController.size(e.get('size'));
                      crudController.deskripsi(e.get('deskripsi'));
                      // Beritahu jika sedang update
                      Get.to(() => TodoPage(
                            isUpdate: true,
                          ));
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (_) => CustomAlert(
                          id: e.id,
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
  }

  panggilTerus() {
    return StreamBuilder<QuerySnapshot>(
      stream: fsc.users.value.orderBy('nama').snapshots(),
      builder: builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pembelian Helm"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          panggilTerus(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => TodoPage()),
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 209, 25, 86)),
    );
  }
}

// Ini Custom Alert Buat Delete
class CustomAlert extends StatelessWidget {
  const CustomAlert({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    FirestoreController fsc = Get.find();
    return AlertDialog(
      title: const Text('Hapus Data'),
      content: const Text('Kegiatan ini tidak dapat dikembalikan'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Queary untuk delete
            fsc.users.value.doc(id).delete();
            Get.back();
          },
          child: const Text(
            'Hapus',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

// Ini Custom ListTile
class MyListTile extends StatelessWidget {
  const MyListTile(
      {Key? key,
      required this.namaText,
      required this.merkText,
      required this.sizeText,
      required this.deskripsi,
      this.onTap,
      this.onLongPress})
      : super(key: key);

  final String namaText;
  final String merkText;
  final String sizeText;
  final String deskripsi;

  final void Function()? onTap;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        namaText,
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
      subtitle: Text(merkText),
      title: Text(sizeText),
      trailing: Text(deskripsi),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
