// import 'dart:html';

import 'package:flutter/material.dart';



class ListViews extends StatelessWidget {
  const ListViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VIEW ALL JOBS"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      
      ),
      body: Column(
        children: [
          Image.asset('images/stop.png'),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0), // Adjust the padding as needed
              child: ListView(
                itemExtent: 100.0,
                reverse: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.work),backgroundColor: Colors.white24,),
                      title: Text("View Jobs"),
                      subtitle: Text("j001 :Brass"),
                      trailing: Icon(Icons.add),
                      onTap: (){},
                      tileColor: Colors.orange.shade400,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.work),backgroundColor: Colors.white24,),
                      title: Text("View Jobs"),
                      subtitle: Text("j001 :Brass"),
                      trailing: Icon(Icons.add),
                      onTap: (){},
                      tileColor: Colors.orange.shade400,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.work),backgroundColor: Colors.white24,),
                      title: Text("View Jobs"),
                      subtitle: Text("j001 :Brass"),
                      trailing: Icon(Icons.add),
                      onTap: (){},
                      tileColor: Colors.orange.shade400,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.work),backgroundColor: Colors.white24,),
                      title: Text("View Jobs"),
                      subtitle: Text("j001 :Brass"),
                      trailing: Icon(Icons.add),
                      onTap: (){},
                      tileColor: Colors.orange.shade400,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.work),backgroundColor: Colors.white24,),
                      title: Text("View Jobs"),
                      subtitle: Text("j001 :Brass"),
                      trailing: Icon(Icons.add),
                      onTap: (){},
                      tileColor: Colors.orange.shade400,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.work),backgroundColor: Colors.white24,),
                      title: Text("View Jobs"),
                      subtitle: Text("j001 :Brass"),
                      trailing: Icon(Icons.add),
                      onTap: (){},
                      tileColor: Colors.orange.shade400,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.work),backgroundColor: Colors.white24,),
                      title: Text("View Jobs"),
                      subtitle: Text("j001 :Brass"),
                      trailing: Icon(Icons.add),
                      onTap: (){},
                      tileColor: Colors.orange.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
