class Labor{
  String Employee;
  int jobid;
  String hour;
  String rate;
  double ammount;

  Labor({

    required this.Employee,
    required this.jobid,
    required this.hour,
    required this.rate,
    required this.ammount,
  });

   factory Labor.fromJson(Map<String, dynamic> json) {
    return Labor(
      jobid: json['jobId'] ,
      Employee: json['emmployee'],
      hour: json['hour'],
      rate: json['rate'],
      ammount: json['ammount'] ,
    

    );
  }
}

