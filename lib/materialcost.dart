// import 'dart:ffi';

// ignore_for_file: unused_label

// import 'package:app/material.dart';
import 'package:avikances/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaterialCost extends StatelessWidget {
  List<Materials> mats = allMaterials;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Material Cost"),
          centerTitle: true,
          backgroundColor: Colors.orange,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        ),
        body: ListView.builder(
          itemCount: mats.length,
          itemBuilder: (context, index) {
            final material = mats[index];
           

            return Slidable(
              startActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    backgroundColor: Colors.green,
                    icon: Icons.approval,
                    label: 'Approval',
                    onPressed: (context) => onDismissed(),
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const BehindMotion(),
                children: [
                  SlidableAction(
                    backgroundColor: Colors.red,
                    icon: Icons.restore_from_trash_outlined,
                    label: 'Reject',
                    onPressed: (context) {
                      // Add your logic here for rejecting
                      // For example, you can show a default dialog message
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Are you sure you want to reject?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                                // Add your rejection logic here''

                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Reason"),
                                          content: TextFormField(
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              labelText: "add reason",
                                              border: OutlineInputBorder(),
                                              prefixIcon: Icon(Icons.note_add),
                                            ),
                                            validator: (value) {},
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Send Reason '),
                                            ),
                                          ],
                                        ));
                              },
                              child: Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text('No'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              child: buildMatsListTitle(material),
            );
          },
        ));
  }

  onDismisseds() {}

  onDismissed() {}

  Widget buildMatsListTitle(Materials material) => ListTile(
        
        contentPadding: const EdgeInsets.all(16),
        title: Text(material.jobid),
        
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(material.material),
            Text("Rate: ${material.rate}"),
            Text("Quantity: ${material.qty}"),
            Text("Date: ${material.date}"),
            
          ],
        ),
        trailing: Text("Amount: ${material.ammout}"),
            
        autofocus: true,
      );
}
