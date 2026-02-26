import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash1Screen extends HookWidget {
  const Splash1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final contents = [
      "Privacy by Default, With Zero Ads or Hidden Tracking",
      "Insights That Help You Spend Better Without Complexity",
      "Local First Tracking That Stays Fully on Your Device",
    ];

    final descriptions = [
      "No ads. No tracker. No third-party-analytics",
      "See category-wise spending, recent activity..",
      "Your finances stay on your phone.",
    ];

    final currentIndex = useState<int>(0);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 56, right: 24),
                  child: GestureDetector(
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "SKIP",
                          style: GoogleFonts.anekLatin(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2.5,
                        margin: EdgeInsets.only(left: 20, right: 4),
                        decoration: BoxDecoration(
                          color: currentIndex.value == 0
                              ? Colors.white.withOpacity(1.0)
                              : Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2.5,
                        margin: EdgeInsets.only(left: 4, right: 4),
                        decoration: BoxDecoration(
                          color: currentIndex.value == 1
                              ? Colors.white.withOpacity(1.0)
                              : Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2.5,
                        margin: EdgeInsets.only(left: 4, right: 20),
                        decoration: BoxDecoration(
                          color: currentIndex.value == 2
                              ? Colors.white.withOpacity(1.0)
                              : Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 16),
                        child: Text(
                          contents[currentIndex.value],
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(descriptions[currentIndex.value]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
