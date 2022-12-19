import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/user_model.dart';

import '../widgets/our_toast.dart';

class APIService {
  Future<List<UserModel>?> userAPI() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    List<UserModel> user_model_list = [];
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      Hive.box<UserModel>("userDetails").clear();

      List<dynamic> responseJson = json.decode(response.body);
      print(responseJson);
      if (response.statusCode == 200) {
        print("Inside status code 200");
        print('=========');
        // print(responseJson);
        responseJson.forEach((element) {
          // print(element);
          UserModel userModel = UserModel.fromJson(element);
          // print(userModel);
          user_model_list.add(userModel);
          Hive.box<UserModel>("userDetails").add(userModel);
        });
        print(user_model_list);
        // StudentProfileModel studentProfileModel =
        //     StudentProfileModel.fromMap(responseJson);
        // await Hive.box<StudentProfileModel>("student_profile").add(
        //   studentProfileModel,
        // );
        // OurToast().showSuccessToast(
        //     "Welcome, ${studentProfileModel.first_name} ${studentProfileModel.middle_name} ${studentProfileModel.last_name}");

        // print(studentProfileModel);
      } else {
        print("Error");
        print('=========');
        print(response.statusCode);
        print('=========');
      }
      return user_model_list;
    } catch (e) {
      print(e);
      OurToast().showErrorToast(e.toString());
    }
  }
}
