

import 'dart:ffi';

class Materials {
  String jobid;
  String material;
  int qty;
  double ammout;
  String date;
  int rate;


  Materials(
      {required this.jobid,
      required this.material,
      required this.qty,
      required this.ammout,
      required this.date,
      required this.rate,
      
      });

      
  factory Materials.fromJson(Map<String, dynamic> json) {
    return Materials(
      jobid: json['job_item_id'] ,
      material: json['matrial'],
      qty: json['qty'],
      ammout: json['amount'],
      date: json['added_date'] ,
      rate: json['rate'],

    );
  }
}

