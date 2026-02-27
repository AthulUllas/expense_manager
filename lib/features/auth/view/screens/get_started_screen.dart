import 'package:animations/animations.dart';
import 'package:expense_manager/features/auth/repository/auth_repository.dart';
import 'package:expense_manager/features/auth/service/auth_service.dart';
import 'package:expense_manager/features/auth/view/screens/verify_otp_screen.dart';
import 'package:expense_manager/features/splash/view/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneCntrllr = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Login using Phone & OTP",
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: TextField(
                controller: phoneCntrllr,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 24),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Phone",
                  hintStyle: GoogleFonts.plusJakartaSans(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 20,
                  ),
                  prefix: Text(
                    "+91   |   ",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 24,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          NextButton(
            text: "Continue",
            width: MediaQuery.of(context).size.width,
            onTap: () async {
              if (phoneCntrllr.text.length == 10) {
                final repository = AuthRepository(AuthService());
                final number = "+91${phoneCntrllr.text.trim()}";
                final numberNoCode = number.substring(3);
                final sendOtp = await repository.sendOtp(number);
                if (sendOtp.otp.isNotEmpty) {
                  debugPrint(sendOtp.otp);
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          VerifyOtpScreen(
                            phoneNumber: numberNoCode,
                            responseModel: sendOtp,
                          ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeThroughTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              child: child,
                            );
                          },
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
