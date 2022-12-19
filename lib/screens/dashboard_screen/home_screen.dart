import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myapp/api_service/api_service.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/widgets/home_page_tile.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_home_tile.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import '../../controller/progress_indicator_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => ModalProgressHUD(
            inAsyncCall: Get.find<ProgressIndicatorController>().index.value,
            progressIndicator: SpinKitDoubleBounce(
              size: ScreenUtil().setSp(35),
              duration: const Duration(milliseconds: 1500),
              color: darkLogoColor,
              // itemBuilder: (BuildContext context, int index) {
              //   return DecoratedBox(
              //     decoration: BoxDecoration(
              //       color: index.isEven ? lightLogoColor : darkLogoColor,
              //     ),
              //   );
              // },
            ),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: darkLogoColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "Internsathi 2",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(25),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              body: SafeArea(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(10),
                      vertical: ScreenUtil().setSp(10),
                    ),
                    child: FutureBuilder<List<UserModel>?>(
                      future: APIService().userAPI(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<UserModel>?> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  UserModel userModel = snapshot.data![index];
                                  return OurHomeTile(userModel: userModel);
                                });
                          } else {
                            Column(
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/images/logo.png",
                                    height: ScreenUtil().setSp(250),
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
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
                          return Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  "assets/images/logo.jpg",
                                  height: ScreenUtil().setSp(250),
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
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
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: darkLogoColor,
                              ),
                            ],
                          );
                        }
                      },
                    )),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: darkLogoColor,
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  size: ScreenUtil().setSp(30),
                  color: Colors.white,
                ),
              ),
            ),
          )),
    );
  }
}
