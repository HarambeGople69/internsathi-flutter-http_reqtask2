// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/colors.dart';

class OurTile extends StatelessWidget {
  final String title;
  final String value;
  const OurTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  get darkLogoColor => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(17.5),
              color: darkLogoColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
            child: Text(
          value,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(15),
            color: lightLogoColor,
            fontWeight: FontWeight.w500,
          ),
        )),
      ],
    );
  }
}
