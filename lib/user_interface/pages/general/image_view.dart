import 'dart:io';

import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/user_interface/widgets/load_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  final String imagePath;
  final bool isNetworkUrl;

  ImageView({
    Key key,
    this.imagePath,
    this.isNetworkUrl = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).trans("image_view"),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: PhotoView.customChild(
          minScale: PhotoViewComputedScale.contained * 1,
          maxScale: PhotoViewComputedScale.covered * 3,
          backgroundDecoration: BoxDecoration(color: Colors.grey[200]),
          child: Container(
            child: isNetworkUrl
                ? LoadNetworkImage(
                    src: imagePath,
                    fit: BoxFit.contain,
                  )
                : Image.file(
                    File(imagePath),
                  ),
          ),
        ),
      ),
    );
  }
}
