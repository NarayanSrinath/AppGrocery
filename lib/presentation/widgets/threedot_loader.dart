import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';

class ThreeDotLoader extends StatefulWidget {
  const ThreeDotLoader({super.key});

  @override
  _ThreeDotLoaderState createState() => _ThreeDotLoaderState();
}

class _ThreeDotLoaderState extends State<ThreeDotLoader> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    // ✅ Fixed issue: Use named arguments for Tween
    _animation = Tween<double>(begin: 0.2, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: (_animation.value - (index * 0.2)).clamp(0.2, 1.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
