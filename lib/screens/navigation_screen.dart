import 'package:covid_tracker_app/screens/about_us_screen.dart';
import 'package:covid_tracker_app/screens/countries_list_screen.dart';
import 'package:covid_tracker_app/screens/home_country_screen.dart';
import 'package:covid_tracker_app/screens/global_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          backgroundColor: Colors.transparent,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          destinations: [
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/earth_icon.png',
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : null,
              ),
              label: 'Global',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/location_icon.png',
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : null,
              ),
              label: 'Home Country',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/flag_icon.png',
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : null,
              ),
              label: 'Countries',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/about_icon.png',
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : null,
              ),
              label: 'About',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  RxList<Widget> screens = [
    GlobalScreen(),
    HomeCountryScreen(),
    CountriesListScreen(),
    AboutUsScreen(),
  ].obs;
}
