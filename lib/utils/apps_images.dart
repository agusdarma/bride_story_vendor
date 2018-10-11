import 'package:bride_story/utils/constant.dart';
import 'package:flutter/material.dart';



Widget imageFromAsset(String iconName) {
  String imageName = kAssetImageFolder + iconName;
  return Image.asset(imageName,
      height: 175.0,
      width: 175.0,
      fit: BoxFit.fill,
  );
}