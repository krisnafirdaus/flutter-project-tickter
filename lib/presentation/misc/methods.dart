import 'package:flutter/material.dart';

Map<double, SizedBox> _verticalSpaces = {};
Map<double, SizedBox> _horizontalSpaces = {};

SizedBox verticalSpace(double height) {
  if(!_verticalSpaces.containsKey(height)){
    _verticalSpaces[height] = SizedBox(
      height: height,
    );
  }

  return _verticalSpaces[height]!;
}

SizedBox horizontalSpace(double width) {
  if(!_verticalSpaces.containsKey(width)){
    _verticalSpaces[width] = SizedBox(
      width: width,
    );
  }

  return _verticalSpaces[width]!;
}
