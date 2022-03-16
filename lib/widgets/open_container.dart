import 'package:animations/animations.dart';
import 'package:flutter/material.dart';


class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (context, action) {
        return const SizedBox.shrink();
      },
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}