import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

class HospitalCard extends StatelessWidget {
  final String index;
  const HospitalCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: "hospital$index",
                      child: Image.asset(
                        'assets/images/hosptial.jpg',
                        fit: BoxFit.fill,
                        width: 50,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AutoSizeText(
                        "Yemen Saudi Hospitals",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                        overflowReplacement: Marquee(
                          text: "Dr haitham Hussien",
                          blankSpace: 20.0,
                          accelerationCurve: Curves.easeOut,
                          velocity: 50.0,
                          startPadding: 2.0,
                          showFadingOnlyWhenScrolling: true,
                          startAfter: 5.seconds,
                          fadingEdgeEndFraction: 0.5,
                          fadingEdgeStartFraction: 0.5,
                          pauseAfterRound: 5.seconds,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primaryColor,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Text(
                              "Sana'a Yemen",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 2,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 10,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "4.2",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
