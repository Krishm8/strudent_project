import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strudent_project/detail.dart';
import 'package:strudent_project/edit.dart';
import 'package:strudent_project/util.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Homepage(),
        "detail": (context) => DetailsPage(),
        "edit": (context) => EditPage(),
      },
    ),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? xF;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Student Data",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          StudentDetail student = studentList[index];
          return Card(
            child: ListTile(
              leading: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Change Image"),
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
                              XFile? file = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
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
                  setState(() {});
                },
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage:
                      FileImage(File(xF ?? studentList[index].xFile ?? "")),
                ),
              ),
              title: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "edit");
                },
                child: Text('Name: ${student.name}'),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("GR-ID: ${student.grid}"),
                  Text("Std: ${student.std}"),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          TextEditingController studentNameController =
                              TextEditingController(
                                  text: studentList[index].name);
                          TextEditingController studentGridController =
                              TextEditingController(
                                  text: studentList[index].grid);
                          TextEditingController studentStdController =
                              TextEditingController(
                                  text: studentList[index].std);
                          return AlertDialog(
                            title: Center(child: Text("Edit Student Profile")),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        FileImage(File(student.xFile ?? "")),
                                    radius: 50,
                                    child: Align(
                                        alignment: Alignment(1, 1),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text("Change Image"),
                                                    actions: [
                                                      InkWell(
                                                        onTap: () async {
                                                          XFile? file =
                                                              await ImagePicker()
                                                                  .pickImage(
                                                                      source: ImageSource
                                                                          .gallery);
                                                          if (file != null) {
                                                            setState(() {
                                                              xF = file.path;
                                                            });
                                                          }
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "Gallery",
                                                        ),
                                                      ),
                                                      SizedBox(width: 5),
                                                      InkWell(
                                                        onTap: () async {
                                                          XFile? file =
                                                              await ImagePicker()
                                                                  .pickImage(
                                                                      source: ImageSource
                                                                          .camera);
                                                          if (file != null) {
                                                            setState(() {
                                                              xF = file.path;
                                                            });
                                                          }
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "Camera",
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.black,
                                            ))),
                                  ),
                                  TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: studentNameController,
                                    decoration:
                                        InputDecoration(labelText: 'Name'),
                                  ),
                                  TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: studentGridController,
                                    decoration:
                                        InputDecoration(labelText: 'GR-ID'),
                                  ),
                                  TextField(
                                    controller: studentStdController,
                                    decoration:
                                        InputDecoration(labelText: 'Std'),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    studentList[index].name =
                                        studentNameController.text;
                                    studentList[index].grid =
                                        studentGridController.text;
                                    studentList[index].std =
                                        studentStdController.text;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text("Save"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      studentList.removeAt(index);
                      setState(() {});
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, "detail");
          if (result != null && result is StudentDetail) {
            setState(() {
              studentList.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
