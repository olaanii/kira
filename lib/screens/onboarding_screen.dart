import 'package:flutter/material.dart';

import '../theme/kira_theme.dart';
import '../widgets/kira_common.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key, required this.onGetStarted});

  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: KiraColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 8),
            const KiraTopPill(),
            const SizedBox(height: 12),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(26),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://www.figma.com/api/mcp/asset/d3c743b1-7772-42af-ac94-b46720458685',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF90B44B),
                                      Color(0xFFF0A550),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              );
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  const Color(0xCCF5F2ED),
                                  const Color(0xFFF5F2ED),
                                ],
                                stops: const [0, 0.5, 0.75, 1],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 40,
                    left: 13,
                    child: _CalorieTag(label: '170 kcal', height: 100),
                  ),
                  const Positioned(
                    top: 111,
                    left: 137,
                    child: _CalorieTag(label: '90 kcal', height: 128),
                  ),
                  const Positioned(
                    top: 16,
                    right: 31,
                    child: _CalorieTag(label: '110 kcal', height: 80),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                      decoration: const BoxDecoration(
                        color: KiraColors.background,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Your Food,\nDecoded By AI',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.9,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'From scanning to tracking –\neverything happens automatically.',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 17,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              _PageDot(active: false),
                              SizedBox(width: 8),
                              _PageDot(active: false),
                              SizedBox(width: 8),
                              _PageDot(active: true),
                            ],
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFF222222),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              onPressed: onGetStarted,
                              child: const Text(
                                'Get Started',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CalorieTag extends StatelessWidget {
  const _CalorieTag({required this.label, required this.height});

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F6EF).withValues(alpha: 0.9),
            border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
            borderRadius: BorderRadius.circular(999),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF222222),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 1,
          height: height,
          color: Colors.white.withValues(alpha: 0.7),
          child: Column(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF8A65),
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.only(left: 4),
              ),
              const Spacer(),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.only(left: 6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PageDot extends StatelessWidget {
  const _PageDot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF222222)
            : const Color(0xFF7B7B7B).withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
    );
  }
}
