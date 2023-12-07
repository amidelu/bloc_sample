import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTopWidget extends StatelessWidget {
  const LoginTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/top2.png"),
              ),
            ),
          ),
          Container(
            height: 160.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/top1.png"),
              ),
            ),
          ),
          Positioned(
            top: 50.h,
            right: 20.h,
            child: Image.asset(
              'assets/images/uni_logo.png',
              height: 70,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
