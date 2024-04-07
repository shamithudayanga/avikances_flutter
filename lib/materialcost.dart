import 'package:avikances/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MaterialCost extends StatefulWidget {
  @override
  _MaterialCostState createState() => _MaterialCostState();
}

class _MaterialCostState extends State<MaterialCost> {
  late Future<List<Materials>> _materials;

  @override
  void initState() {
    super.initState();
    _materials = fetchMaterials();
  }

  Future<List<Materials>> fetchMaterials() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2/api/v1/material/searchMaterial'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Materials> materials =
          body.map((dynamic item) => Materials.fromJson(item)).toList();
      return materials;
    } else {
      throw 'Failed to load materials';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Cost"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
      ),
      body: FutureBuilder<List<Materials>>(
        future: _materials,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Materials material = snapshot.data![index];
                return Slidable(
                  startActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.green,
                        icon: Icons.approval,
                        label: 'Approval',
                        onPressed: (context) =>
                            onDismissed(), // Implement your approval logic here
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
                          // Implement your rejection logic here
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Confirmation'),
                              content: Text('Are you sure you want to reject?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                    // Add your rejection logic here
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Reason"),
                                        content: TextFormField(
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            labelText: "Add reason",
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
                                            child: Text('Send Reason'),
                                          ),
                                        ],
                                      ),
                                    );
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
                  child: ListTile(
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
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          // By default, show a loading spinner.
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

onDismisseds() {}

onDismissed() {}
