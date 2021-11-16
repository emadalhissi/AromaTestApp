import 'package:flutter/material.dart';

class BnbActiveIcon extends StatelessWidget {
  const BnbActiveIcon({
    Key? key,
    required this.bnbActiveIcon,
  }) : super(key: key);

  final IconData bnbActiveIcon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('images/bnb_c_1.png'),
          radius: 28,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('images/bnb_c_2.png'),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('images/bnb_c_3.png'),
            ),
          ),
        ),
        Positioned.fill(
          child: Icon(bnbActiveIcon, color: Colors.white),
        ),
      ],
    );
  }
}