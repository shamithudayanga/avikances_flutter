import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: const Text("Noted"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              'Hi, Take Photo page',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 300,
              child: Image.asset(
                "images/camara.png",
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orangeAccent,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {},
                child: const Text("Take a Photo"),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  maxLines: 5,
                  
                ),
                ),
          ],
        ),
      ),
    );
  }
}
