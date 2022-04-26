import 'package:flutter/material.dart';


class GalleryDetails extends StatelessWidget{
  static const path = 'GalleryDetails';
  const GalleryDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: args['img'],
      )
    );
  }
}