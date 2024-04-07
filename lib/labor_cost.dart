// import 'package:app/labor.dart';
// import 'package:app/material.dart';
import 'package:avikances/labor.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LaborCost extends StatefulWidget {
  @override
  _LaborCostState createState() => _LaborCostState();
}

class _LaborCostState extends State<LaborCost> {
  late Future<List<Labor>> _labor;

  @override
  void initState() {
    super.initState();
    _labor = fetchLabour();
  }

  Future<List<Labor>> fetchLabour() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2/api/v1/labour/labourSearch'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Labor> materials =
          body.map((dynamic item) => Labor.fromJson(item)).toList();
      return materials;
    } else {
      throw 'Failed to load Labour';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Labor Cost"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
      ),
      body: FutureBuilder<List<Labor>>(
        future: _labor,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Labor labor = snapshot.data![index];
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
                    title: Text(labor.Employee),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rate:${labor.rate}"),
                        Text("JobId: ${labor.jobid}"),
                      ],
                    ),
                    trailing: Text("Amount: ${labor.ammount}"),
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

  onDismisseds() {}

  onDismissed() {}
}
