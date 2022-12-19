import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/widgets/home_page_tile.dart';

import 'our_sized_box.dart';

class OurHomeTile extends StatelessWidget {
  final UserModel userModel;
  const OurHomeTile({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setSp(5),
        vertical: ScreenUtil().setSp(5),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setSp(5),
        vertical: ScreenUtil().setSp(5),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Column(
        children: [
          OurTile(
            title: "Name",
            value: userModel.name ?? "",
          ),
          OurSizedBox(),
          OurTile(
            title: "Username",
            value: userModel.username ?? "",
          ),
          OurSizedBox(),
          OurTile(
            title: "Email",
            value: userModel.name ?? "",
          ),
          OurSizedBox(),
          OurTile(
            title: "Address",
            value:
                "${userModel.address!.street},${userModel.address!.suite},${userModel.address!.city},${userModel.address!.zipcode}," ??
                    "",
          ),
          OurSizedBox(),
          OurTile(
            title: "Phone",
            value: userModel.phone ?? "",
          ),
          OurSizedBox(),
          OurTile(
            title: "Website",
            value: userModel.website ?? "",
          ),
          OurSizedBox(),
        ],
      ),
    );
    ;
  }
}
