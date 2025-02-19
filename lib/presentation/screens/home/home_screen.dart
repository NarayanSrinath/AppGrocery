import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/core/utils/AppFont.dart';
import 'package:groceryapp/core/utils/AppColors.dart';
import 'package:groceryapp/presentation/widgets/custom_button.dart';
import 'package:groceryapp/presentation/screens/home/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _otpFormKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _otpFocusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onOTPChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      // Move to next field if input is entered
      FocusScope.of(context).requestFocus(_otpFocusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      // Move to previous field if input is cleared
      FocusScope.of(context).requestFocus(_otpFocusNodes[index - 1]);
    }
  }

  String _getEnteredOTP() {
    return _otpControllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),

                    // ✅ Top Row (Skip Button Hidden if Verified)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(), // Placeholder for alignment

                        if (state is! Verified) // Hide when state is Verified
                          TextButton(
                            onPressed: () {
                               Navigator.pushReplacementNamed(context, '/dashboard'); // ✅ Navigate to Dashboard
                            }, // Add your action here
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.2),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Skip',
                              style: AppFonts.body.copyWith(
                                fontSize: 18,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // ✅ Grocery App Text
                    Text(
                      'Grocery\nApp',
                      style: AppFonts.heading.copyWith(
                        fontSize: 40,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ✅ We Deliver Your Grocery in Minutes Text
                    Text(
                      'We deliver your \ngrocery in minutes',
                      style: AppFonts.subHeading.copyWith(
                        fontSize: 30,
                        color: Colors.white70,
                      ),
                    ),

                    // ✅ Main Content (Phone Input, OTP, or Verified State)
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Vertically center content
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align items to the left
                        children: [
                          if (state is HomeInitial) ...[
                            // ✅ OTP Message
                            Text(
                              'You will receive a 4-digit code for phone number verification.',
                              style: AppFonts.italic
                                  .copyWith(color: Colors.white70),
                            ),
                            const SizedBox(height: 20),

                            // ✅ Phone Input Field
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                children: [
                                  Text(
                                    '+91',
                                    style: AppFonts.body
                                        .copyWith(color: AppColors.white),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      style: AppFonts.body
                                          .copyWith(color: AppColors.white),
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: 'Phone number',
                                        hintStyle: AppFonts.body
                                            .copyWith(color: Colors.white54),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),

                            // ✅ Continue Button
                            CustomButton(
                              icon: Icons.arrow_forward,
                              text: 'Continue',
                              onTap: () =>
                                  context.read<HomeBloc>().onContinuePressed(),
                            ),
                          ],
                          if (state is EnteringOTP) ...[
                            // ✅ OTP Heading
                            Text(
                              'Enter OTP',
                              style: AppFonts.subHeading.copyWith(
                                fontSize: 24,
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 16),

                            // ✅ OTP Description
                            Text(
                              'A 4-digit verification code has been sent to your mobile number',
                              style:
                                  AppFonts.body.copyWith(color: Colors.white54),
                              textAlign: TextAlign.left,
                            ),

                            const SizedBox(height: 24),

                            // 🔴 Error Message (Only Show if OTP is Incorrect)
                            if (state.isOTPIncorrect)
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Text(
                                    'Invalid OTP. Please try again.',
                                    style: AppFonts.body.copyWith(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              ),

                            // ✅ OTP Input Fields (Using TextFields for better UX)
                            Form(
                              key: _otpFormKey,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(4, (index) {
                                  return Container(
                                    width: 55,
                                    height: 60,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: TextFormField(
                                      controller: _otpControllers[index],
                                      focusNode: _otpFocusNodes[index],
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // ✅ Allow only nu
                                      style: AppFonts.body.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      maxLength: 1,
                                      cursorColor: AppColors.white,
                                      onChanged: (value) =>
                                          _onOTPChanged(value, index),
                                    ),
                                  );
                                }),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // 🔹 OTP Countdown Timer (Hidden when timer reaches 0)
                            if (state.timerSeconds > 0)
                              Text(
                                'Resend OTP in ${state.timerSeconds}s',
                                style: AppFonts.body
                                    .copyWith(color: Colors.white70),
                              ),
                            const SizedBox(height: 20),

                            // 🔹 Verify & Resend OTP Buttons (Side by Side)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Verify Button
                                CustomButton(
                                  icon: Icons.check,
                                  text: 'Verify',
                                  onTap: () {
                                    String enteredOTP = _getEnteredOTP();
                                    context
                                        .read<HomeBloc>()
                                        .verifyOTP(enteredOTP);
                                  },
                                ),

                                const SizedBox(
                                    width: 20), // Space between buttons

                                // Resend OTP Button (Disabled initially)
                                TextButton(
                                  onPressed: state.isResendEnabled
                                      ? () =>
                                          context.read<HomeBloc>().resendOTP()
                                      : null,
                                  child: Text(
                                    'Resend OTP',
                                    style: AppFonts.body.copyWith(
                                      color: state.isResendEnabled
                                          ? AppColors.primary
                                          : Colors.white38,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          if (state is Verified) ...[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 🔹 Success Message
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.check_circle,
                                          color: AppColors.primary, size: 24),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Phone Number Verified Successfully!',
                                        style: AppFonts.body.copyWith(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 30),

                                // 🔹 Enter Name Text
                                Text(
                                  'Enter Your Name',
                                  style: AppFonts.subHeading
                                      .copyWith(color: Colors.white70),
                                ),

                                const SizedBox(height: 20),

                                // 🔹 Name Input Field
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: TextField(
                                    style: AppFonts.body
                                        .copyWith(color: AppColors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Enter your name',
                                      hintStyle: AppFonts.body
                                          .copyWith(color: Colors.white54),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 30),

                                // 🔹 Continue Button
                                CustomButton(
                                  icon: Icons.arrow_forward,
                                  text: 'Continue',
                                  onTap: () {
                                     Navigator.pushReplacementNamed(context, '/dashboard'); // ✅ Navigate to Dashboard
                                  },
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
