// import 'package:app/fixed.dart';
import 'package:avikances/fixed.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FixedCost extends StatelessWidget {
  List<Fix> fix = allFixed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fixed Cost"),
          centerTitle: true,
          backgroundColor: Colors.orange,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        ),
        body: ListView.builder(
          itemCount: fix.length,
          itemBuilder: (context, index) {
            final fixed = fix[index];

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
              child: buildLaborListTitle(fixed),
            );
          },
        ));
  }

  onDismisseds() {}

  onDismissed() {}

    Widget buildLaborListTitle(Fix fixed) => ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(fixed.jobid),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fixed.dept_id),
            Text("Rate: ${fixed.rate}"),
            Text("Fixed: ${fixed.fixed_type}"),
         
          ],
        ),
        trailing: Text("Amount: ${fixed.amount}"),
        autofocus: true,
      );
}
