// import 'package:app/finsh.dart';
import 'package:avikances/finsh.dart';
import 'package:flutter/material.dart';

class FinshJobs extends StatelessWidget {
  List<Finsh> jobs = allFinshJobs;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Finsh Jobs"),
          backgroundColor: Colors.orangeAccent,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            final Job = jobs[index];

            return Column(
              children: [
                buildLaborListTitle(Job),
              ],
            );
          },
        ));
  }

  onDismisseds() {}

  onDismissed() {}

  Widget buildLaborListTitle(Finsh job) => ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(job.jobs),
        subtitle: Text("Status : ${job.status}"),
        trailing: Text("Date: ${job.Date}"),
        autofocus: true,
        textColor: Colors.black,
      );
}
