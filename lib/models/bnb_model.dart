import 'package:flutter/material.dart';

class BnbModel {
  final String title;
  final Widget widget;
  final PreferredSizeWidget? appBar;

  BnbModel({
    required this.title,
    required this.widget,
    this.appBar,
  });
}
