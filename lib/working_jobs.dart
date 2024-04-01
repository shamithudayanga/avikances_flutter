import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

class WorkingJobs extends StatelessWidget {
  final jobs = [];

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addJobs() {
    jobs.insert(0, "Jobs ${jobs.length + 1}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Working Jobs"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        
      //  color: Colors.orange, 
        
        child: ProgressBarList(),
      ),
    );
  }
}

class ProgressBarList extends StatelessWidget {
  final List<ProgressData> dataList = [
    ProgressData(label: 'job1', percentage: 0.7, text: "shamith udayanga"),
    ProgressData(label: 'job3', text: "shamith udayanga", percentage: 0.3),
    ProgressData(label: 'job2', text: "shamith udayanga", percentage: 0.5),
    ProgressData(label: 'job7', text: "shamith udayanga", percentage: 0.2),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ProgressBarListItem(data: dataList[index]);
        
      },
    );
  }
}

class ProgressBarListItem extends StatelessWidget {
  final ProgressData data;

  ProgressBarListItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.label),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.text),
          LinearProgressIndicator(value: data.percentage),
          SizedBox(height: 20),
          Text('${(data.percentage * 100).toStringAsFixed(0)}% Complete'),
        ],
      ),
    );
  }
}

class ProgressData {
  final String label;
  final String text;
  final double percentage;

  ProgressData(
      {required this.label, required this.percentage, required this.text});
}
