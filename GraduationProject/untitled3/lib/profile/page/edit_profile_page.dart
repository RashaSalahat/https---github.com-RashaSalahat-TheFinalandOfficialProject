import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:hotel_booking/profile/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:hotel_booking/profile/model/user.dart';
import 'package:hotel_booking/profile/utils/user_preferences.dart';
import 'package:hotel_booking/profile/widget/appbar_widget.dart';
import 'package:hotel_booking/profile/widget/button_widget.dart';
import 'package:hotel_booking/profile/widget/profile_widget.dart';
import 'package:hotel_booking/profile/widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              //isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
            const SizedBox(height: 24),
            Container(
              width: 100,
              // height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffffae88), Color(0xff8f93ea)],
                ),
              ),
              child: MaterialButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (BuildContext context) {
                    //     return ProfilePage(
                    //     );
                    //   },
                    // ));
                  },
                  // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
}
