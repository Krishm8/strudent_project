import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strudent_project/util.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController studentNameController =
      TextEditingController(text: studentData.name);
  TextEditingController studentGridController =
      TextEditingController(text: studentData.grid);
  TextEditingController studentStdController =
      TextEditingController(text: studentData.std);

  String? xFile;

  GlobalKey<FormState> fKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CupertinoColors.darkBackgroundGray,
      appBar: AppBar(
        backgroundColor: CupertinoColors.link,
        foregroundColor: Colors.white,
        title: Text(
          'Detail Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black12,
                    backgroundImage: FileImage(File(xFile ?? "")),
                    child: Align(
                      alignment: Alignment(1, 1),
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
                                          xFile = file.path;
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
                                          xFile = file.path;
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
                        child: Icon(Icons.camera_alt),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    key: fKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, right: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: studentNameController,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your name";
                              }
                            },
                            decoration: InputDecoration(
                              label: Text("Name"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "Name",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your GR-id";
                              }
                            },
                            controller: studentGridController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              label: Text("GR-id"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "GR-id",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, right: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Std";
                              }
                            },
                            controller: studentStdController,
                            decoration: InputDecoration(
                              label: Text("Std"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "Std",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),






            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CupertinoColors.link,
                foregroundColor: Colors.white,
                elevation: 7,
              ),
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ), // Button text
              onPressed: () {
                bool isValid = fKey.currentState?.validate() ?? false;

                if (isValid) {
                  fKey.currentState?.save();
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Saved")),
                  );
                }

                if (xFile != null) {
                  StudentDetail studentData = StudentDetail(
                    name: studentNameController.text,
                    grid: studentGridController.text,
                    std: studentStdController.text,
                    xFile: xFile,
                  );
                  Navigator.pop(context, studentData);
                } else {
                  // Handle case where no image is selected
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("Select an image."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }




              },
            ),
          ],
        ),
      ),
    );
  }
}
