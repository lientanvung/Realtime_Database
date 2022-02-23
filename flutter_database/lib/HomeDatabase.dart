import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/DatabaseCustom.dart';

class HomeDatabase extends StatefulWidget {
  @override
  _HomeDatabaseState createState() => _HomeDatabaseState();
}

class _HomeDatabaseState extends State<HomeDatabase> {
  final fb = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('users');
    return Scaffold(
      backgroundColor: Color(0xff009966),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Database(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Users',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Database(),
              ),
            );
          },
        ),
      ),
      body: FirebaseAnimatedList(
        query: ref, //Dữ liệu bên DatabaseCustom sẽ được đưa vào từ đây (ref)
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.indigo[100],
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[900],
                    ),
                    onPressed: () {
                      ref
                          .child(snapshot.key!)
                          .remove(); //Khi nhấn vào nút xóa, nó sẽ xóa thông tin người dùng như Tên và số điện thoại trên màn hình HomeDatabase và cả trên realtime database
                    },
                  ),
                  title: Text(
                    snapshot.value
                        .toString(), // Đây là cách dữ liệu như Tên và số điện thoại được hiển thị
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
