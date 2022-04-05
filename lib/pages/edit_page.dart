import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_4_method/controller/edit_controller.dart';
import 'package:getx_4_method/views/itemOfTextField.dart';



import '../models/post_model.dart';


//ignore: must_be_immutable
class EditPage extends StatefulWidget {
  static String id ="EditPage";
  Post? post;
   EditPage({Key? key, required this.post}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<EditController>().editPagePost(widget.post!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Post"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Get.find<EditController>().apiEditData(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: GetX<EditController>(
        init: EditController(),
        builder: (EditController controller) => Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              texFormField(hintText: 'Title', controller: controller.titleController()),
              texFormField(hintText: 'Body', controller: controller.bodyController()),
            ],
          ),
        ),
      )
    );

  }
}
