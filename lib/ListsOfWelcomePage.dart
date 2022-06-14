import 'package:flutter/cupertino.dart';
import 'package:mountain_app/pages/PageOfWelcome.dart';

class Page {
  String ChangeableText;
  String AssetImage;
  Page({
    required this.AssetImage,
    required this.ChangeableText,
  });
}

List<Page> ListOfPages = [
  Page(
      ChangeableText:
          "An enjoyable trip to the high mountains with many exclusive features",
      AssetImage: "img/Welocome Img/welcome-one.png"),
  Page(
      ChangeableText:
          "Now enjoy this trip to the cold mountains for a limited time and enjoy mountain climbing ",
      AssetImage: "img/Welocome Img/welcome-two.png"),
  Page(
      ChangeableText:
          "What prevents you from going to new places you have not been before? Go now and seize the opportunity",
      AssetImage: "img/Welocome Img/welcome-three.png"),

];
