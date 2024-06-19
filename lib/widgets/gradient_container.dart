import 'package:flutter/material.dart';
import 'package:birthday_wish_card/helpers/helper_functions.dart';


class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.avatarImage,});

  final Widget avatarImage;
  @override
  Widget build(BuildContext context) {
    double screenWidth = HelperFunctions.getScreenWidth(context);
    double screenHeight = HelperFunctions.getScreenHeight(context);
    return Container(
      padding: EdgeInsets.all(screenHeight * 0.02),
      width: screenWidth * 0.8,
      height: screenHeight * 0.6,
      decoration: _containerDecoration(),
      child: Center(
        child: avatarImage,
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withOpacity(0.25),
          Colors.white.withOpacity(0.1),
          Colors.white.withOpacity(0.0),
        ],
      ),
    );
  }
}
