import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_challange/config/theme/constants/colors.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/profile_picture.dart';

import '../../../domain/entities/user.dart';

class ProfileView extends StatelessWidget {
  final User? user;
  ProfileView({User? givenUser, super.key})
      : user = givenUser ??
      // TODO Clean this after linking with BE
            User(
              name: 'Ruben Geidt',
              email: 'ruben.geidt@example.com',
              pictureUrl:
                  'https://thumbs.dreamstime.com/b/portrait-smiling-red-haired-millennial-men-looking-camera-sitting-cafe-coffeeshop-happy-young-male-glasses-posing-133039122.jpg',
            );

  @override
  Widget build(BuildContext context) {
    final buildProfilePicture = Center(
      child: Stack(
        children: [
          ProfilePicture(url: user?.pictureUrl),
          const Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: kPrimaryLight,
              child: Icon(Icons.edit, size: 18, color: kWhiteKColor),
            ),
          ),
        ],
      ),
    );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Align(alignment: Alignment.centerLeft, child: Text('Profile', style: Theme.of(context).textTheme.displayLarge)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: buildProfilePicture,
            ),
            Text(user?.name ?? 'Not Defined', style: Theme.of(context).textTheme.titleLarge),
            Text(user?.email ?? 'Not Defined', style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 30),
            ...List.generate(
              ProfileOptions.values.length,
              (index) {
                return index == 3
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10, bottom: 20),
                            child: const Divider(color: kDactivateColor),
                          ),
                          _ProfileListTile(onTap: () => _manageAction(ProfileOptions.values[index]), index: index),
                        ],
                      )
                    : _ProfileListTile(onTap: () => _manageAction(ProfileOptions.values[index]), index: index);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _manageAction(ProfileOptions value) {
    // TODO Add Action
    switch (value) {
      case ProfileOptions.details:
        break;
      case ProfileOptions.settings:
        break;
      case ProfileOptions.notification:
        break;
      case ProfileOptions.support:
        break;
      case ProfileOptions.logout:
        break;
      default:
    }
  }
}

class _ProfileListTile extends StatelessWidget {
  final int index;
  final void Function() onTap;
  const _ProfileListTile({required this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 65,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: const Color(0xFFF7F7F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Center(
        child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 16,
          title: Text(ProfileOptions.values[index].value, style: Theme.of(context).textTheme.displayMedium),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: kWhiteKColor,
            child: SvgPicture.asset(ProfileOptions.values[index].icon, width: 22),
          ),
          trailing: const Icon(Icons.chevron_right, size: 24),
        ),
      ),
    );
  }
}

enum ProfileOptions {
  details('Profile details', 'assets/icons/user_icon.svg'),
  settings('Settings', 'assets/icons/settings_icon.svg'),
  notification('Push Notifications', 'assets/icons/bell_icon.svg'),
  support('Support', 'assets/icons/support_icon.svg'),
  logout('Logout', 'assets/icons/logout_icon.svg');

  final String value;
  final String icon;

  const ProfileOptions(this.value, this.icon);
}
