import 'package:bmi_calculator/app_colors.dart';
import 'package:bmi_calculator/slide_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double heightValue = 120;
  int weightValue = 50;
  int ageValue = 24;
  bool isDark = true;
  bool? isMale;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:
            isDark ? AppColors.primaryBlack : AppColors.primaryWhite,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
                    width: 116,
                    height: 38,
                    decoration: BoxDecoration(
                      color:
                          isDark
                              ? AppColors.greyContainers
                              : AppColors.whiteText,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isDark = false;
                            });
                          },
                          icon: Icon(
                            Icons.light_mode_outlined,
                            color: isDark ? AppColors.greyText : AppColors.blue,
                            size: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isDark = true;
                            });
                          },
                          icon: Icon(
                            Icons.nights_stay_outlined,
                            color: isDark ? AppColors.blue : AppColors.greyText,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Text(
                  "Welcome😊",
                  style: TextStyle(
                    color: isDark ? AppColors.greyText : AppColors.primaryBlack,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "BMI Calculator",
                  style: TextStyle(
                    color:
                        isDark ? AppColors.whiteText : AppColors.primaryBlack,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  spacing: 12, //! Spacing must be variable
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50,
                      minWidth: 160,
                      onPressed: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      color:
                          isMale == null
                              ? AppColors.whiteText
                              : isMale!
                              ? AppColors.blue
                              : AppColors.whiteText,
                      child: Row(
                        spacing: 4,

                        children: [
                          Icon(Icons.male),
                          Text(
                            "Male",
                            style: TextStyle(
                              color:
                                  isMale == null
                                      ? AppColors.blue
                                      : isMale!
                                      ? AppColors.whiteText
                                      : AppColors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50,
                      minWidth: 160,
                      onPressed: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      color:
                          isMale == null
                              ? AppColors.whiteText
                              : isMale!
                              ? AppColors.whiteText
                              : AppColors.blue,
                      child: Row(
                        spacing: 4,
                        children: [
                          Icon(Icons.female),
                          Text(
                            "Female",
                            style: TextStyle(
                              color:
                                  isMale == null
                                      ? AppColors.blue
                                      : isMale!
                                      ? AppColors.blue
                                      : AppColors.whiteText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26),
                SizedBox(
                  height: 350,
                  child: Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color:
                                isDark
                                    ? AppColors.greyContainers
                                    : AppColors.whiteText,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Height',
                                style: TextStyle(color: AppColors.greyText),
                              ),
                              Text(
                                heightValue.round().toString(),
                                style: TextStyle(color: AppColors.greyText),
                              ),
                              Expanded(
                                child: SfSlider.vertical(
                                  activeColor: AppColors.blue,
                                  inactiveColor: AppColors.primaryWhite,
                                  min: 30,
                                  max: 220.0,
                                  value: heightValue,
                                  interval: 20,
                                  showTicks: false,
                                  showLabels: true,
                                  enableTooltip: false,
                                  minorTicksPerInterval: 0,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      heightValue = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 12,

                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color:
                                      isDark
                                          ? AppColors.greyContainers
                                          : AppColors.whiteText,
                                ),
                                child: Column(
                                  spacing: 16,
                                  children: [
                                    Text(
                                      'Weight',
                                      style: TextStyle(
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                    Text(
                                      weightValue.toString(),
                                      style: TextStyle(
                                        color:
                                            isDark
                                                ? AppColors.whiteText
                                                : AppColors.primaryBlack,

                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        MaterialButton(
                                          color: AppColors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          minWidth: 10,
                                          height: 60,
                                          onPressed: () {
                                            setState(() {
                                              weightValue--;
                                            });
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: AppColors.whiteText,
                                          ),
                                        ),
                                        MaterialButton(
                                          color: AppColors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          minWidth: 10,
                                          height: 60,
                                          onPressed: () {
                                            setState(() {
                                              weightValue++;
                                            });
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.whiteText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color:
                                      isDark
                                          ? AppColors.greyContainers
                                          : AppColors.whiteText,
                                ),
                                child: Column(
                                  spacing: 16,
                                  children: [
                                    Text(
                                      'Age',
                                      style: TextStyle(
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                    Text(
                                      ageValue.toString(),
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            isDark
                                                ? AppColors.whiteText
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        MaterialButton(
                                          color: AppColors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          minWidth: 10,
                                          height: 60,
                                          onPressed: () {
                                            setState(() {
                                              ageValue--;
                                            });
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: AppColors.whiteText,
                                          ),
                                        ),
                                        MaterialButton(
                                          color: AppColors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          minWidth: 10,
                                          height: 60,
                                          onPressed: () {
                                            setState(() {
                                              ageValue++;
                                            });
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.whiteText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Center(
                  child: SlideButton(
                    isDark: isDark,
                    height: heightValue.round(),
                    weight: weightValue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
