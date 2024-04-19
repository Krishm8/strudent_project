import 'package:flutter/material.dart';
import 'package:strudent_project/detail.dart';
import 'package:strudent_project/util.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "detail": (context) => DetailPage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Student Data",
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 3,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                setState(() {});
              },
              child: Icon(
                Icons.refresh,
                color: Colors.black,
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: sDetail.profiledata.map((e) {
          return Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 100,
            width: double.infinity,
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${e["name"]}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "GRid:   ${e["grid"]}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Standard: ${e["standard"]}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  width: 130,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "detail");
                  },
                  child: Icon(Icons.edit),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      sDetail.profiledata.remove(e);
                      setState(() {});
                    },
                    child: Icon(Icons.delete)),
              ],
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "detail");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

/*
Column(
        children: sDetail.profiledata.map((e) {
          return Container(
            margin: EdgeInsets.only(top: 10),
            height: 100,
            width: double.infinity,
            color: Colors.red,
            child: Column(
              children: [
                Text(
                  sDetail.name ?? "",
                  style: TextStyle(fontSize: 20),
                ),
                Text(e),
              ],
            ),
          );
        }).toList(),
      ),
 */
