
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/common/const/image_assets.dart';
import 'package:submission_finpro/feature/home/home_controller.dart';
import 'package:submission_finpro/feature/home/home_course_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.shortestSide < 600;
    Get.find<HomeController>().getBanner();
    Get.find<HomeController>().getLoginUser();
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        GetBuilder<HomeController>(
            builder: (HomeController controller){
              return controller.userData !=null ?
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      SizedBox(
                        height: 70,
                        width: 180,
                        child: ListTile(
                          title: Text(controller.userData?.userName ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          subtitle: const Text("Selamat Datang"),
                        ),
                      ),
                      CircleAvatar(
                        maxRadius: 30,
                        child:  ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            width: 60,
                            imageUrl: controller.userData?.userFoto ?? "",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  :
              const Center(
                child: LinearProgressIndicator(),
              );
            }
        ),
        GetBuilder<HomeController>(
            builder: (HomeController bannerController){
              return  SizedBox(
                height: 150,
                child: Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.blue,
                  elevation: 5,
                  shadowColor: Colors.black,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text(
                            "Mau Kerjakan Soal Apa Hari Ini?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child:   SvgPicture.asset(
                            ImageAssets.imageIllustrationLoginSvg,
                            height: 255,
                          ),
                      )
                    ],
                  )
                ),
              );
            }
        ),
        const HomeCourseWidget(),
       const  Padding(
          padding:  EdgeInsets.all(8.0),
          child:  Text("Terbaru",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        GetBuilder<HomeController>(
            builder: (HomeController bannerListController){
             return SizedBox(
               height: 200,
               child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: bannerListController.bannerList.length,
                    itemBuilder: (context,index){
                      return  SizedBox(
                        width: 200,
                        child: Card(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            color: Colors.blue,
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: CachedNetworkImage(
                              imageUrl: bannerListController.bannerList[index].eventImage ?? "",
                              fit: BoxFit.fill,
                            )
                        )
                      );
                    }
                ),
             );
            }
        ),
      ],
    );
  }
}
