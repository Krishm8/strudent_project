import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strudent_project/util.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController tnameController = TextEditingController();
  TextEditingController tgridController = TextEditingController();
  TextEditingController tstdController = TextEditingController();
  String? xfile;
  GlobalKey<FormState> fKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Form(
        key: fKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: FileImage(File(xfile ?? "")),
                child: InkWell(
                  onTap: () async {
                    XFile? Simg =
                        await ImagePicker().pickImage(source: ImageSource.camera);
                    xfile = Simg?.path ?? "";
                    setState(() {});
                  },
                  child: Align(
                      alignment: Alignment(0.95, 1),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 25,
                      )),
                ),
                backgroundColor: Colors.grey,
                radius: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Your name";
                    }
                  },
                  controller: tnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter student name",
                    label: Text("Name"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Your GRid";
                    }
                  },
                  controller: tgridController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter student GRid",
                    label: Text("GRid"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Your std";
                    }
                  },
                  controller: tstdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter student Std",
                    label: Text("Std"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(10),
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      bool isValid = fKey.currentState?.validate() ?? false;
                      if (isValid) {
                        fKey.currentState?.save();
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Saved")),
                        );
                        Map m1 = {
                          "name": tnameController.text,
                          "grid": tgridController.text,
                          "standard": tstdController.text,
                        };
                        sDetail.profiledata.add(m1);
                        Navigator.pop(context);
                        setState(() {
                        });
                      }
                    },
                    child: Text("Submit"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(10),
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      tnameController.clear();
                      tgridController.clear();
                      tstdController.clear();
                    },
                    child: Text("Reset"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}