import 'package:flutter/material.dart';
import 'package:flutter_challange/config/theme/constants/colors.dart';

class ProfilePicture extends StatelessWidget {
  final String? url;

  const ProfilePicture({this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return url != null && url != ''
        ? CircleAvatar(
            radius: 60,
            backgroundColor: kPrimaryLight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(url!, fit: BoxFit.cover, width: 105, height: 105),
            ),
          )
        : CircleAvatar(
            radius: 60,
            backgroundColor: kPrimaryLight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network('https://via.placeholder.com/110x110', fit: BoxFit.cover, width: 105, height: 105),
            ),
          );
  }
}
