import 'package:flutter/material.dart';

class CustomRichTextWidget extends StatelessWidget {
  const CustomRichTextWidget({super.key, this.title, this.data});
  final String? title;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: RichText(
        softWrap: true,
        text: TextSpan(children: [
          TextSpan(
            text: '$title: ',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: data, style: Theme.of(context).textTheme.bodyMedium,
          ),
        ]),
      ),
    );
  }
}
