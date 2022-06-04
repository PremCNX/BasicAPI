import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ความรู้เกี่ยวกับคอมพิวเตอร์ by LaonCNX! ",
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            builder: (context, snapshort) {
              var data = json.decode(
                  snapshort.data.toString()); // [{คอมพิวเตอร์คืออะไร...},{},{}]
              return ListView.builder(
                itemBuilder: (BuildContext, int index) {
                  return Mybox(data[index]['title'], data[index]['subtitle'],
                      data[index]['img_url'], data[index]['detail']);
                },
                itemCount: data.length,
              );
            },
            future:
                DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }

  Widget Mybox(String title, String subtitle, String img_url, String detail) {
    var v1 = title;
    var v2 = subtitle;
    var v3 = img_url;
    var v4 = detail;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      //color: Colors.blue[50],
      height: 200,
      decoration: BoxDecoration(
          //color: Colors.blue[50],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(img_url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.50), BlendMode.darken))),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          TextButton(
              onPressed: () {
                print("NextPage>>>");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(v1, v2, v3, v4)));
              },
              child: Text("อ่านต่อ..."))
        ],
      ),
    );
  }
}
