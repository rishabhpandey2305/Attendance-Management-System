import 'package:attendance_management_system/presentation/resources/colors.dart';
import 'package:attendance_management_system/presentation/resources/sizes.dart';
import 'package:attendance_management_system/presentation/resources/text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:attendance_management_system/presentation/resources/assets.dart';

late Assets assets;
late AppSizes sizes;
late AppColors colors;
late AppTextStyles styles;

void initializeResources(BuildContext context) {
  sizes = AppSizes()..initializeSize(context);
  assets = Assets();
  colors = AppColors();
  styles = AppTextStyles();
}
final RegExp emailpattern = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");