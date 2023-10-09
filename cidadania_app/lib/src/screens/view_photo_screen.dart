import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewPhotoScreen extends StatelessWidget {
  final String url;
  const ViewPhotoScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                CupertinoIcons.back,
              ),
            ),
            Center(
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
