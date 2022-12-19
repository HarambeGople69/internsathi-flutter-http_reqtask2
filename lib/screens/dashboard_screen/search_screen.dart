import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/widgets/our_home_tile.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_text_field.dart';

import '../../models/user_model.dart';
import '../../utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _search_controller = TextEditingController();
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkLogoColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Search",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(25),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              OurSizedBox(),
              TextField(
                controller: _search_controller,
                decoration: InputDecoration(label: Text("Enter name")),
                onChanged: (values) {
                  setState(() {
                    value = values;
                  });
                  print(value);
                },
              ),
              ValueListenableBuilder(
                valueListenable:
                    Hive.box<UserModel>("userDetails").listenable(),
                builder: (context, Box<UserModel> boxs, child) {
                  var a = boxs.keys.toList();
                  print(a);
                  if (a.isNotEmpty) {
                    return ListView.builder(
                        itemCount: a.length,
                        itemBuilder: (context, index) {
                          // return Text("data");
                          UserModel userModel = boxs.get(a[index])!;
                          return userModel.name!.toLowerCase().trim() ==
                                  value.toLowerCase().trim()
                              ? OurHomeTile(userModel: userModel)
                              : Text(value);
                        });
                  } else {
                    return Column(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: ScreenUtil().setSp(250),
                            width: MediaQuery.of(context).size.width * 0.75,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text(
                          "No data available",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(25),
                              color: darkLogoColor),
                        )
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
