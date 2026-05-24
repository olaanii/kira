import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/dashboard_screen.dart';
import '../screens/discovery_screen.dart';
import '../screens/onboarding_screen.dart';
import '../theme/kira_theme.dart';

class KiraApp extends StatelessWidget {
  const KiraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kira',
      debugShowCheckedModeBanner: false,
      theme: KiraTheme.light,
      home: const KiraRoot(),
    );
  }
}

class KiraRoot extends StatefulWidget {
  const KiraRoot({super.key});

  @override
  State<KiraRoot> createState() => _KiraRootState();
}

class _KiraRootState extends State<KiraRoot> {
  bool _showOnboarding = true;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void _handleNavSelection(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _completeOnboarding() {
    setState(() {
      _showOnboarding = false;
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      child: _showOnboarding
          ? OnboardingScreen(
              key: const ValueKey('onboarding'),
              onGetStarted: _completeOnboarding,
            )
          : _selectedIndex == 0
          ? DashboardScreen(
              key: const ValueKey('dashboard'),
              selectedIndex: _selectedIndex,
              onNavSelected: _handleNavSelection,
            )
          : DiscoveryScreen(
              key: const ValueKey('discovery'),
              selectedIndex: _selectedIndex,
              onNavSelected: _handleNavSelection,
            ),
    );
  }
}
