import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<TextEditingController> searchController =
      TextEditingController().obs;
}
