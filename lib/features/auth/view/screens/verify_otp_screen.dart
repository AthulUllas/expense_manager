import 'package:animations/animations.dart';
import 'package:expense_manager/features/auth/helper/number_mask_helper.dart';
import 'package:expense_manager/features/auth/model/auth_response_model.dart';
import 'package:expense_manager/features/auth/view/screens/get_started_screen.dart';
import 'package:expense_manager/features/auth/view/widgets/otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({
    super.key,
    required this.phoneNumber,
    required this.responseModel,
  });

  final String phoneNumber;
  final AuthResponseModel responseModel;

  @override
  Widget build(BuildContext context) {
    final otp1Cntrllr = TextEditingController();
    final otp2Cntrllr = TextEditingController();
    final otp3Cntrllr = TextEditingController();
    final otp4Cntrllr = TextEditingController();
    final otp5Cntrllr = TextEditingController();
    final otp6Cntrllr = TextEditingController();
    final maskedNumber = maskNumber(phoneNumber);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Verify OTP",
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
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Enter 6-digit code sent to $maskedNumber",
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const GetStartedScreen(),
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
                    },
                    child: Text(
                      "Change Number",
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.blue,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Row(
            children: [
              SizedBox(width: 10),
              OtpTextfield(controller: otp1Cntrllr),
              OtpTextfield(controller: otp2Cntrllr),
              OtpTextfield(controller: otp3Cntrllr),
              OtpTextfield(controller: otp4Cntrllr),
              OtpTextfield(controller: otp5Cntrllr),
              OtpTextfield(controller: otp6Cntrllr),
            ],
          ),
        ],
      ),
    );
  }
}
