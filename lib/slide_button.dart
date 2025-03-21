// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/app_colors.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideButton extends StatelessWidget {
  final bool isDark;

  final int height;
  final int weight;
  const SlideButton({
    super.key,
    required this.height,
    required this.weight,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final GlobalKey<SlideActionState> key = GlobalKey();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SlideAction(
            key: key,
            onSubmit: () {
              Future.delayed(
                Duration(seconds: 1),
                () => key.currentState!.reset(),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ResultScreen(
                        height: height,
                        weight: weight,
                        isDark: isDark,
                      ),
                ),
              );
              return null;
            },
            elevation: 20,
            sliderButtonIcon: Icon(Icons.arrow_forward_ios_outlined),
            outerColor: AppColors.blue,
            text: "Calculate",
            innerColor: AppColors.whiteText,
            height: 80,
            borderRadius: 16,
            animationDuration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
