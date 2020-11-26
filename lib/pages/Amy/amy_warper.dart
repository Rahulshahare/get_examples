// For easy and so that the example dose not get complated with files and directory this file will represent all page class

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_page_example/shared/widgets/body.dart';

class AmyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAmyRepository>(() => AmyRepository());
    Get.lazyPut(() => AmyController(amyRepository: Get.find()));
  }
}

abstract class IAmyRepository {
  Future<dynamic> getPageName();
}

class AmyRepository implements IAmyRepository {
  @override
  Future<dynamic> getPageName() => 2.delay(() => 'Amy Page');
}

class AmyController extends GetxController {
  AmyController({this.amyRepository});
  final IAmyRepository amyRepository;

  final name = 'loading ..'.obs;
  @override
  void onInit() {
    super.onInit();
    amyRepository.getPageName().then((value) => name.value = value);
  }
}

class AmyView extends GetView<AmyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(controller.name.value))),
      body: BodyWidget(),
    );
  }
}
