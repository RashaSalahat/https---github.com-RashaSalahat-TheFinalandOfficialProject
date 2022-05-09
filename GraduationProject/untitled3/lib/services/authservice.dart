import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();
  login(name, password) async {
    try {
      return await dio.post('http://10.0.2.2:3000/authenticate',
          data: {"name": name, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  addUser(name, password) async {
    return await dio.post('http://10.0.2.2:3000/adduser',
        data: {"name": name, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addWorkout(userid, name, Mon, Tue, Wed, Thur, Fri, Sat, Sun) async {
    return await dio.post('http://10.0.2.2:3000/addWorkout',
        data: {
          "userid": userid,
          "name": name,
          "Mon": Mon,
          "Tue": Tue,
          "Wed": Wed,
          "Thur": Thur,
          "Fri": Fri,
          "Sat": Sat,
          "Sun": Sun
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addSleep(userid, name, Mon, Tue, Wed, Thur, Fri, Sat, Sun) async {
    return await dio.post('http://10.0.2.2:3000/addSleep',
        data: {
          "userid": userid,
          "name": name,
          "Mon": Mon,
          "Tue": Tue,
          "Wed": Wed,
          "Thur": Thur,
          "Fri": Fri,
          "Sat": Sat,
          "Sun": Sun
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addMilk(userid, name, Mon, Tue, Wed, Thur, Fri, Sat, Sun) async {
    return await dio.post('http://10.0.2.2:3000/addMilk',
        data: {
          "userid": userid,
          "name": name,
          "Mon": Mon,
          "Tue": Tue,
          "Wed": Wed,
          "Thur": Thur,
          "Fri": Fri,
          "Sat": Sat,
          "Sun": Sun
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addMass(userid, name, Age, AgeType, Height, Mass) async {
    return await dio.post('http://10.0.2.2:3000/addMass',
        data: {
          "userid": userid,
          "name": name,
          "Age": Age,
          "AgeType": AgeType,
          "Height": Height,
          "Mass": Mass
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  getinfo(token) async {
    dio.options.headers['Authorizations'] = 'Bearer $token';
    return await dio.get('http://10.0.2.2:3000/getinfo');
  }

  update(about, email, image) async {
    return await dio.post('http://10.0.2.2:3000/updateOne',
        data: {"about": about, "email": email, "userImage": image},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
