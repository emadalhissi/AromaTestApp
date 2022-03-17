import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool selectAllCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                right: 20,
                left: 20,
                bottom: 0,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      width: double.infinity,
                      // height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 1.5,
                            offset: const Offset(0, 0.5),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          PositionedDirectional(
                            end: 10,
                            top: 10,
                            child: InkWell(
                              onTap: () {},
                              child: const Icon(Icons.clear),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 12,
                              bottom: 12,
                              end: 10,
                              start: 8,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Color(0xff8C8C8C)),
                                  ),
                                  child: Checkbox(
                                    value: selectAllCheckBox,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectAllCheckBox = newValue!;
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    checkColor: Color(0xff8C8C8C),
                                    activeColor: Colors.transparent,
                                    side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                            color: Colors.transparent)),
                                    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                SizedBox(width: 8),
                                SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(6),
                                    child: const Image(
                                      image: AssetImage('images/app1.png'),
                                      fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'اشتراك اروما 3 شهور',
                                        style: TextStyle(
                                          color: Color(0xff171717),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        // maxLines: 1,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            '70',
                                            style: TextStyle(
                                              color: Color(0xffD6111E),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(width: 3),
                                          Text(
                                            'ر.س',
                                            style: TextStyle(
                                              color: Color(0xffD6111E),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Container(
                                            width: 28,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffBCBCBC)
                                                  .withOpacity(0.45),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 25),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                              color: Color(0xff646363),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 25),
                                          Container(
                                            width: 28,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffBCBCBC)
                                                  .withOpacity(0.45),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 1.5,
                      offset: const Offset(0, 0.5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'الاجمالي',
                            style: TextStyle(
                              color: Color(0xff8C8C8C),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                '1500',
                                style: TextStyle(
                                  color: Color(0xffD6111E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'ر.س',
                                style: TextStyle(
                                  color: Color(0xffD6111E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffD6111E),
                              Color(0xff970810),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'دفع',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '(2)',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
  }
}

// appBar: AppBar(
//         toolbarHeight: 60,
//         flexibleSpace: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.centerRight,
//                   end: Alignment.centerLeft,
//                   colors: [
//                     Color(0xff970810),
//                     Color(0xffBB0D16),
//                   ],
//                 ),
//               ),
//             ),
//             const Positioned(
//               left: 82,
//               top: 25,
//               child: Image(
//                 image: AssetImage('images/a_c_1.png'),
//                 height: 90,
//                 width: 90,
//               ),
//             ),
//             const Positioned(
//               left: 140,
//               top: -8,
//               child: Image(
//                 image: AssetImage('images/a_c_2.png'),
//                 height: 90,
//                 width: 90,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: const Image(
//                 image: AssetImage('images/support.png'),
//               )),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.notifications_outlined, size: 25),
//           ),
//           const SizedBox(width: 5)
//         ],
//         title: Row(
//           children: [
//             Container(
//               width: 22,
//               height: 22,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 border: Border.all(color: Colors.white),
//               ),
//               child: Checkbox(
//                 value: selectAllCheckBox,
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectAllCheckBox = newValue!;
//                   });
//                 },
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 checkColor: Colors.white,
//                 activeColor: Colors.transparent,
//                 side: MaterialStateBorderSide.resolveWith(
//                     (states) => const BorderSide(color: Colors.transparent)),
//                 // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//               ),
//             ),
//             const SizedBox(width: 10),
//             const Text(
//               'تحديد الكل',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
