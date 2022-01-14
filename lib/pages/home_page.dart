import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference fruitList =
      FirebaseFirestore.instance.collection('fruit-list');
  final Stream<QuerySnapshot> collectionStream =
      FirebaseFirestore.instance.collection('fruit-list').snapshots();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                  Text("Loading"),
                ],
              ),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              print(data["fruitName"]);
              return ListTile(
                title: Text(data["fruitName"]),
                trailing: IconButton(
                  onPressed: () => removeFruit(
                    context: context,
                    documentReference: document.reference,
                    fruitName: data["fruitName"],
                  ),
                  icon: const Icon(Icons.delete),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_context) {
                TextEditingController textEditingController =
                    TextEditingController();
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      TextField(
                        controller: textEditingController,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          addFruit(
                              context: context,
                              fruitName: textEditingController.text);
                        },
                        child: const Text("Submit"),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void addFruit({required BuildContext context, required String fruitName}) {
    fruitList.add({"fruitName": fruitName}).then((value) {
      showSnackBar(
          context: context, message: "$fruitName has been added to the list");

      SnackBar(content: Text("$fruitName has been added to the list"));
    }).catchError((error) => print("Failed to add fruit: $error"));
  }

  showSnackBar({required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: const Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  removeFruit(
      {required BuildContext context,
      required DocumentReference documentReference,
      required String fruitName}) {
    documentReference.delete().then((value) {
      showSnackBar(
          context: context, message: "$fruitName has been removed to the list");
      SnackBar(content: Text("$fruitName has been deleted to the list"));
    }).catchError((error) => print("Failed to delete fruit: $error"));
  }
}
