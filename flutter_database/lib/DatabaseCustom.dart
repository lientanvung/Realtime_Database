import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/HomeDatabase.dart';

// File databaseCustom dùng để add dữ liệu vào trong màn hình HomeDatabase và add trên realtime database
class Database extends StatelessWidget {
  TextEditingController Name =
      TextEditingController(); //Dùng để thêm tên cho người dùng
  TextEditingController Phone =
      TextEditingController(); //Dùng để thêm số điện thoại cho người dùng

  final fb = FirebaseDatabase.instance; //Sử dụng cơ sở dữ liệu của firebase

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child(
        'users'); // Mục cha trong realtime database chứa dữ liệu về người dùng (trong firebase)

    return Scaffold(
      backgroundColor: Color(0xff009966),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Add Users"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                controller: Name,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintStyle: TextStyle(color: Color(0xff99CCCC), fontSize: 16),
                  hintText: 'Name',
                ),
              ),
            ),
            Container(
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                controller: Phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintStyle: TextStyle(color: Color(0xff99CCCC), fontSize: 16),
                  hintText: 'Phone',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(60),
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                color: Color(0xff003333),
                onPressed: () {
                  //Sau khi bấm Save, dữ liệu về Tên người dùng (Name) và Số điện thoại (Phone) sẽ được thêm vào màn hình HomeDatabase và lưu trên realtime database
                  ref.push().set({
                    Name.text: Phone.text
                  }).asStream(); //ref.push.. lưu dữ liệu trong set({}) vào ref (user) (ref là final ở dòng số 16)

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => HomeDatabase()));
                },
                child: Text(
                  "save",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff99CCCC),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
