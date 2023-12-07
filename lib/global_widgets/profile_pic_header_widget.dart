import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePicHeaderWidget extends StatelessWidget {
  const ProfilePicHeaderWidget(
      {super.key, required this.isUploadShown, this.onPress});

  final bool isUploadShown;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 5.0),
          child: Column(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
                  imageUrl: '',
                  placeholder: (context, url) =>
                      const Center(child: const CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/image-holder.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.r),
                  Text(
                    'Not Found',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
