import 'package:flutter/material.dart';

class ProductScreenFeedbackContainer extends StatelessWidget {
  const ProductScreenFeedbackContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: const Color(0xff262323).withOpacity(0.25),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'محمد أحمد',
                    style: TextStyle(
                      color: Color(0xff171717),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFB850),
                  ),
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFB850),
                  ),
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFB850),
                  ),
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFB850),
                  ),
                  Icon(
                    Icons.star,
                    color: const Color(0xff262323).withOpacity(0.25),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '4.5',
                    style: TextStyle(
                      color: Color(0xff171717),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لق تم توليد هذا النص من مولد النص العربى،',
                style: TextStyle(
                  color: Color(0xff8C8C8C),
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
