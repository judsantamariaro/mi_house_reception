import 'package:flutter/material.dart';

class SocialNetworkIcons extends StatelessWidget {
  const SocialNetworkIcons({
    Key? key,
    this.onPressedGoogle,
    this.onPressedFacebook,
    this.onPressedTwitter,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.height = 100,
  }) : super(key: key);

  final VoidCallback? onPressedGoogle;
  final VoidCallback? onPressedFacebook;
  final VoidCallback? onPressedTwitter;
  final MainAxisAlignment mainAxisAlignment;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        IconButton(
          icon: Image.asset('assets/social_icons/google.png', height: height),
          onPressed: onPressedGoogle,
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: Image.asset('assets/social_icons/facebook.png', height: height),
          onPressed: onPressedFacebook,
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: Image.asset('assets/social_icons/twitter.png', height: height),
          onPressed: onPressedTwitter,
        ),
      ],
    );
  }
}
