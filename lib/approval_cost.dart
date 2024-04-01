import 'package:avikances/fixed_cost.dart';
import 'package:avikances/labor_cost.dart';
import 'package:avikances/materialcost.dart';
import 'package:flutter/material.dart';

class CostApproval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Approval Job Cost"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/approval.jpg",
            height: 300,
            width: 500,
            repeat: ImageRepeat.noRepeat,
          ),

          

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MaterialCost()));
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  
                  child: Text(
                    "Material cost",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LaborCost()));
            },
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  "Labor cost",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          ),


          Padding(
             padding: const EdgeInsets.symmetric(vertical: 8.0),
             child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FixedCost()));
            },
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  "Fixed cost",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
