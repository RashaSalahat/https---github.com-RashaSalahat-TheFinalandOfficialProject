import 'package:flutter/material.dart';

import '../../loginpage/login/login_form.dart';
import '../../services/user.dart';

String email = '';
String about = '';
String image = '';
setUseremail(String email1) {
  email = email1;
}

getUseremail() {
  return email;
}

setUserabout(String about1) {
  about = about1;
}

getUserabout() {
  return about;
}

setUserimage(String image1) {
  image = image1;
}

getUserimage() {
  return image;
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // @override
  Userr userService = Userr(); //
  String username = getUsername();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context),
      body: FutureBuilder<List>(
          future: userService.getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  if (snapshot.data![index]['name'] == username) {
                    print(snapshot.data![index]['name']);
                    print(snapshot.data![index]['email']);
                    email = snapshot.data![index]['email'];
                    setUseremail(email);
                    print(snapshot.data![index]['about']);
                    about = snapshot.data![index]['about'];
                    setUserabout(about);
                    print(snapshot.data![index]['userImage']);
                    image = snapshot.data![index]['userImage'];
                    setUserimage(image);
                  }
                  physics:
                  BouncingScrollPhysics();
                  return GestureDetector();
                },
              );
            } else {
              return const Center(
                child: Text('No Data Found'),
              );
            }
          }),
    );
  }
}
