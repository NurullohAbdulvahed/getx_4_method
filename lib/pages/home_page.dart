import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_4_method/controller/home_controller.dart';
import 'package:getx_4_method/views/itemsOfPost.dart';



class HomePage extends StatefulWidget {
  static String id = "HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX"),
        ),
        body: GetX<HomeController>(
          init: HomeController(),
          builder: (HomeController controller) =>  Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.only(bottom: 10),
                itemCount: Get.find<HomeController>().items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(Get.find<HomeController>().items[index],Get.find<HomeController>());
                },
              ),
              Get.find<HomeController>().isLoading()
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Get.find<HomeController>().goToCreatePage(context);
            //Get.changeTheme(ThemeData.dark());
          },
          child: const Icon(Icons.add),
        ));
  }


}
