

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:image_picker_android/image_picker_android.dart';
// import 'package:image_picker/image_picker.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}):super(key: key);

  @override
  State<Notes>createState()=>_NotesState();

}

class _NotesState extends State<Notes>{

  File ?  _selectImage;
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
        title: const Text("JOBS PROCCESSER"),
      ),
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              'Hi, Take a Currently Working Jobs',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
           
           const SizedBox(height: 20),

           _selectImage !=null ?Image.file(_selectImage!):Text("Please pick camara"),
           
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
            Padding(padding: EdgeInsets.all(5)),
            Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                 onTap: (){
                  _imegecamarapiker();
                 },
                ),
                ),

                Container(
                  padding: EdgeInsets.all(15),
                  child: TextButton(onPressed: () {
                    
                  }, 
                  
                  child:  Text("Submit"),
                  
                  style: ElevatedButton.styleFrom(
                    foregroundColor:Colors.white,
                    backgroundColor: Colors.greenAccent,
                    fixedSize: Size.fromWidth(400),
                  ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Future _imegecamarapiker()async{
  //  final retuencamara = await ImagePickerAndroid().pickImage(source: ImageSource.camera);

  //  setState((){
  //   _selectImage = File(retuencamara!.path);

  //  });
  }

}
