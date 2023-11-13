import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class ViewPhotoScreen extends StatefulWidget {
  const ViewPhotoScreen({Key? key,}) : super(key: key);

  @override
  State<ViewPhotoScreen> createState() => _ViewPhotoScreenState();
}

class _ViewPhotoScreenState extends State<ViewPhotoScreen> {
  late String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            IconButton(
              onPressed: () {
                Routefly.pop(context);
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
