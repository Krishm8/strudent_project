import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strudent_project/util.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  // String? sdata;

  String? xF;
  // TextEditingController studentNameController = TextEditingController(text: studentList[index].name);
  // TextEditingController studentGridController = TextEditingController(text: studentList[index].grid);
  // TextEditingController studentStdController = TextEditingController(text: studentList[index].std);

  @override
  Widget build(BuildContext context) {
    // sdata = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Edit Page"),
      ),
      body: Column(
        children: [


          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CircleAvatar(
              radius: 70,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Add Image',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        actions: [
                          InkWell(
                            onTap: () async {
                              XFile? file = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (file != null) {
                                setState(() {
                                  xF = file.path;
                                });
                              }
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Gallery",
                            ),
                          ),
                          SizedBox(width: 5),
                          InkWell(
                            onTap: () async {
                              XFile? file =
                              await ImagePicker().pickImage(source: ImageSource.camera);
                              if (file != null) {
                                setState(() {
                                  xF = file.path;
                                });
                              }
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Camera",
                            ),
                          ),
                        ],
                      );
                    },
                  );
                  setState(() {

                  });
                },
                child: Align(
                  alignment: Alignment(1,0.8),
                    child: Icon(Icons.camera_alt)),
              ),
            ),
          ),






          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Name",
                label: Text("Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "GR-id",
                label: Text("GR-id"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "std",
                label: Text("Std"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Update"),
          )
        ],
      ),
    );
  }
}
