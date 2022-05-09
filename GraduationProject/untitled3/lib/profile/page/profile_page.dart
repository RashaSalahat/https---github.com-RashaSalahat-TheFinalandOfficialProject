import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/profile/page/edit_profile_page.dart';
import 'package:hotel_booking/profile/page/get_profile.dart';
import 'package:hotel_booking/profile/widget/appbar_widget.dart';
import 'package:hotel_booking/profile/widget/button_widget.dart';
import 'package:hotel_booking/profile/widget/numbers_widget.dart';
import 'package:hotel_booking/profile/widget/profile_widget.dart';
import '../../loginpage/login/login_form.dart';
import '../../services/user.dart';

var response;
Userr userService = Userr(); //

Future<void> getData() async {
  response = userService.getAllUsers();
  print(response);
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // @override
  //Userr userService = Userr(); //
  String username = getUsername();
  ProfilePage profile = ProfilePage();

  @override
  Widget build(BuildContext context) {
    print(getUseremail());
    print(getUserabout());
    print(getUserimage());
    return Scaffold(
      // appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            width: 10,
            height: 10,
          ),
          ProfileWidget(
            imagePath:
                "https://avatars.githubusercontent.com/u/78260457?s=96&v=4",
            onClicked: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return EditProfilePage();
                },
              ));
            },
          ),
          const SizedBox(height: 24),
          buildName(),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(),
        ],
      ),
    );
  }

  Widget buildName() => Column(
        children: [
          Text(
            getUsername(), //
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            "Username1.d@gmail.com", //
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Your Profile',
      );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "This User is an Eng", //
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
