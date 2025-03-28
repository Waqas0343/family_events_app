import 'package:family_events_app/app/screens/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_styles/app_constant_file/app_colors.dart';
import '../../app_styles/app_constant_file/app_images.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  MyImages.logo,
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
                const SizedBox(height: 16.0),
                if (!controller.connectivityError.value)
                  const CircularProgressIndicator(
                    color: MyColors.primaryColor,
                  ),
                if (controller.connectivityError.value)
                  Column(
                    children: [
                      const Icon(
                        Icons.signal_wifi_off_outlined,
                        size: 60,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Internet Not available.",
                        style: Get.textTheme.headlineSmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      ElevatedButton(
                        onPressed: () => controller.checkLogin(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                        ),
                        child: const Text(
                          "Retry",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
