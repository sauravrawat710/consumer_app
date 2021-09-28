import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    this.isLoading = false,
    this.expanded = true,
    this.onTap,
  }) : super(key: key);

  final String title;
  final bool isLoading;
  final bool expanded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      width: expanded ? 0.85.sw : null,
      height: 35.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor:
              isLoading ? Colors.grey : Theme.of(context).primaryColor,
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            if (isLoading) ...[
              SizedBox(width: 10.w),
              SpinKitCircle(
                color: Theme.of(context).disabledColor,
                size: 25,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
