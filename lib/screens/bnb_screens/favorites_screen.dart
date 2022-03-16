import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with TickerProviderStateMixin {
  bool _visible = true;
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      lowerBound: 0.1,
    );

    // animation = Tween(begin: 0.8, end: 1.0).animate(animationController);
    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeIn,
      ),
    );

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call setState. This tells Flutter to rebuild the
          // UI with the changes.
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
      body: Center(
        child: Column(
          children: [
            FadeTransition(
              opacity:
                  animationController.drive(CurveTween(curve: Curves.easeOut)),
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.green,
              ),
            ),
            AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              // The green box must be a child of the AnimatedOpacity widget.
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
