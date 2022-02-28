import 'package:aroma_test_app/Providers/lang_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const IntroPage({
    required this.image,
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: AssetImage('images/$image'),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xff171717).withOpacity(0),
                const Color(0xff171717).withOpacity(0.4),
                const Color(0xff171717).withOpacity(0.82),
                const Color(0xff171717).withOpacity(0.85),
                const Color(0xff171717).withOpacity(0.94),
                const Color(0xff171717),
              ],
            ),
          ),
        ),
        Positioned.directional(
          textDirection:
              Provider.of<LangProvider>(context, listen: false).lang == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          top: 182,
          start: 20,
          end: 100,
          bottom: 0,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned.directional(
          textDirection:
              Provider.of<LangProvider>(context, listen: false).lang == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          top: 600,
          start: 20,
          end: 20,
          bottom: 0,
          child: Text(
            subTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
