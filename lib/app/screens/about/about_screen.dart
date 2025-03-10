import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_styles/app_constant_file/app_colors.dart';
import 'about_controller.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AboutUsController controller = Get.put(AboutUsController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: Get.textTheme.titleMedium
              ?.copyWith(color: MyColors.shimmerHighlightColor),
        ),
        backgroundColor: MyColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About the Project',
                style: Get.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'This app aims to provide a comprehensive solution for managing family events and tasks. The app offers a seamless user experience with features like shared shopping lists, event scheduling, and more. It helps families stay organized and connected by offering a centralized platform for all their needs.',
                style: Get.textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Text(
                'Features',
                style: Get.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ...controller.features.map((feature) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        const Icon(Icons.check, color: MyColors.primaryColor),
                        const SizedBox(width: 8),
                        Expanded(
                            child: Text(feature,
                                style: Get.textTheme.titleMedium)),
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
              Text(
                'Meet the Team',
                style: Get.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.teamMembers.length,
                  itemBuilder: (context, index) {
                    final member = controller.teamMembers[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(member.imageUrl),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(member.name, style: Get.textTheme.titleMedium?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            )),
                            Text(member.studentID, style: Get.textTheme.titleMedium),
                          ],
                        ),
                        subtitle: Text(member.role, style: Get.textTheme.titleMedium),
                      ),
                    );
                  },
                );
              }),
              const SizedBox(height: 20),
              Text(
                'Contact Us',
                style: Get.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'If you have any questions, feedback, or need support, feel free to reach out to us at support@familyeventsapp.com.',
                style: Get.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
