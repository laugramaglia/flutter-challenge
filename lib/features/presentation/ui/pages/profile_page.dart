import 'package:flutter/material.dart';
import 'package:flutter_challange/config/theme/icons/app_icons_icons.dart';

const profileLabel = "Profile";
const profileName = "Ruben Geidt";
const profileEmail = "ruben.geidt@example.com";
const profileDetails = "Profile Details";
const profileSettings = "Settings";
const profilePush = "Push Notifications";
const profileSupport = "Support";
const profileLogout = "Logout";

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 11.0),
              child: Text(
                profileLabel,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Image.asset('assets/images/profile.png'),
          const SizedBox(height: 16),
          const Text(
            profileName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          const Text(
            profileEmail,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          _profileItem(
            profileDetails,
            context,
            'assets/images/profile_icon.png',
          ),
          _profileItem(
            profileSettings,
            context,
            'assets/images/scr.png',
          ),
          _profileItem(
            profilePush,
            context,
            'assets/images/bell.png',
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          _profileItem(
            profileSupport,
            context,
            'assets/images/ball.png',
          ),
          _profileItem(
            profileLogout,
            context,
            'assets/images/logout.png',
          ),
        ],
      ),
    );
  }

  Padding _profileItem(String text, BuildContext context, String imageAsset) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFF7F7F7),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(imageAsset)),
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    AppIcons.round_chevron_right,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
