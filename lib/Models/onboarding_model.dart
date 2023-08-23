import 'package:flutter/material.dart';

class OnBoardingModel {
  late Animation<Offset> animationOffset;
  late Animation<double> animationSize;
  late AnimationController animationController;
  late AnimationController animationControllerSize;
  late AnimationController animationControllerSlide;
  late Animation<Offset> animationSlide;

  OnBoardingModel(
      this.animationControllerSlide,
      this.animationSlide,
      this.animationControllerSize,
      this.animationController,
      this.animationSize,
      this.animationOffset);
}
