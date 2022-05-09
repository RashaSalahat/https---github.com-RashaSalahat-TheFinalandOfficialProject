// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
        required this.id,
        required this.name,
        required this.password,
        required this.about,
        required this.email,
        required this.userImage,
    });

    String id;
    String name;
    String password;
    String about;
    String email;
    String userImage;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["_id"],
        name: json["name"],
        password: json["password"],
        about: json["about"],
        email: json["email"],
        userImage: json["userImage"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "password": password,
        "about": about,
        "email": email,
        "userImage": userImage,
    };
}
