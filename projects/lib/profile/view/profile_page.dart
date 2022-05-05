import 'package:flutter/material.dart';

import '../../components/components.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarx(title: "Profile"),
        const Text("Profile"),
      ],
    );
  }
}
