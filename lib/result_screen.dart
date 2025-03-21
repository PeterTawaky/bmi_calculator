import 'dart:math';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:bmi_calculator/app_colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bool isDark;
  final int weight;
  final int height;
  const ResultScreen({
    super.key,
    required this.weight,
    required this.height,
    required this.isDark,
  });

  // double militaryEquation () {
  //   return weight / pow(height / 100, 2);
  // }
  bool _militaryEquation() {
    if (weight > (height - 100) * 1.5) {
      return true;
    } else {
      return false;
    }
  }

  double _calculateBmi() => weight / pow(height / 100, 2);
  //TODO try not to use if condition omar ahmed
  String getWeightStatus() {
    final double bmi = _calculateBmi();
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi < 29.9) {
      return 'Over weight';
    } else {
      return 'Obese';
    }
  }

  String getWeightDiagnosis() {
    final double bmi = _calculateBmi();
    if (bmi < 18.5) {
      return 'May indicate malnutrition, an eating disorder, or other health issues.';
    } else if (bmi < 24.9) {
      return 'Generally associated with good health and lower risk of weight-related diseases.';
    } else if (bmi < 29.9) {
      return 'May suggest an increased risk of conditions like heart disease, diabetes, or hypertension.';
    } else {
      return 'Indicates a higher risk of serious health problems, including cardiovascular disease, stroke, and certain cancers.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? AppColors.primaryBlack : AppColors.primaryWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color:
                          isDark
                              ? AppColors.primaryWhite
                              : AppColors.primaryBlack,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                'Your BMI is',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: CircularPercentIndicator(
                  radius: 140.0,
                  lineWidth: 40.0,
                  percent: _calculateBmi() / 100,
                  center: Text(
                    _calculateBmi().toStringAsFixed(2),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: AppColors.blue,
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: AppColors.blue,
                  backgroundColor: AppColors.emptyPercent,
                ),
              ),
              Center(
                child: Text(
                  getWeightStatus(),
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:
                      isDark ? AppColors.greyContainers : AppColors.whiteText,
                ),
                child: Text(
                  getWeightDiagnosis(),
                  style: TextStyle(
                    color:
                        isDark
                            ? AppColors.primaryWhite
                            : AppColors.primaryBlack,
                  ),
                ),
              ),
              Spacer(),
              MaterialButton(
                padding: EdgeInsets.all(10),
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: AppColors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: AppColors.primaryWhite,
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Text(
                      _militaryEquation()
                          ? 'مبروك الأعفاء'
                          : 'علي مركز التدريب',
                      // 'Find Out More',
                      style: TextStyle(
                        color: AppColors.primaryWhite,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
