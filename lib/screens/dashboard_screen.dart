import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/kira_theme.dart';
import '../widgets/kira_common.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.onNavSelected,
    required this.selectedIndex,
  });

  final ValueChanged<int> onNavSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: KiraColors.background,
      body: Stack(
        children: [
          // Bottom Navigation (behind)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 147,
              padding: const EdgeInsets.fromLTRB(38, 30, 38, 30),
              decoration: const BoxDecoration(color: KiraColors.dark),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _NavButton(
                    icon: Icons.home_rounded,
                    isSelected: selectedIndex == 0,
                    onTap: () => onNavSelected(0),
                  ),
                  _NavButton(
                    icon: Icons.description_outlined,
                    isSelected: selectedIndex == 1,
                    onTap: () => onNavSelected(1),
                  ),
                  _CenterScanButton(),
                  _NavButton(icon: Icons.star_rounded, isSelected: false),
                  _NavButton(icon: Icons.settings_rounded, isSelected: false),
                ],
              ),
            ),
          ),
          // Main Content (in front with rounded bottom)
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                const SizedBox(height: 8),
                const KiraTopPill(),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 103),
                    decoration: const BoxDecoration(
                      color: KiraColors.background,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              KiraIconSquareButton(
                                icon: Icons.calendar_month_outlined,
                              ),
                              Spacer(),
                              Text(
                                'Dashboard',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: KiraColors.textPrimary,
                                ),
                              ),
                              Spacer(),
                              KiraIconSquareButton(
                                icon: Icons.notifications_none_rounded,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const _CalorieGauge(),
                          const SizedBox(height: 18),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE9E2D7),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.add_rounded,
                              color: KiraColors.textMuted,
                              size: 22,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                _MealCard(
                                  imageUrl:
                                      'https://www.figma.com/api/mcp/asset/db64bc00-65e7-462c-957c-926ebd047453',
                                  title: 'Lunch',
                                  time: '02:30 PM',
                                  calories: '693 kcal',
                                  goal: '35% of goal',
                                  protein: '48g',
                                  carbs: '83g',
                                  fat: '25g',
                                ),
                                const SizedBox(height: 12),
                                _MealCard(
                                  imageUrl:
                                      'https://www.figma.com/api/mcp/asset/42abf3c2-d624-4b4a-a76f-14444435d95a',
                                  title: 'Breakfast',
                                  time: '11:30 AM',
                                  calories: '500 kcal',
                                  goal: '25% of goal',
                                  protein: '36g',
                                  carbs: '57g',
                                  fat: '14g',
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Daily nutrition at a glance',
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.icon, required this.isSelected, this.onTap});

  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(
          icon,
          size: 20,
          color: isSelected ? KiraColors.accent : Colors.white,
        ),
      ),
    );
  }
}

class _CenterScanButton extends StatelessWidget {
  const _CenterScanButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: 68,
      decoration: BoxDecoration(
        color: KiraColors.accent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF2D2C2A), width: 4),
        boxShadow: const [
          BoxShadow(
            color: KiraColors.shadow,
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(
        Icons.crop_square_rounded,
        color: KiraColors.dark,
        size: 26,
      ),
    );
  }
}

class _CalorieGauge extends StatelessWidget {
  const _CalorieGauge();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 247,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(size: const Size(210, 210), painter: _GaugePainter()),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.calendar_today,
                color: KiraColors.textPrimary,
                size: 16,
              ),
              const SizedBox(height: 4),
              Text(
                '20 Aug',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: KiraColors.textMuted,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '1250 ',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'kcal',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                'Goal 2000 kcal',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: KiraColors.accentDeep,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 20.0;
    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.width - strokeWidth,
    );

    final basePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = KiraColors.ringBase;

    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = KiraColors.accent;

    const startAngle = math.pi * 0.75;
    const sweep = math.pi * 1.5;
    canvas.drawArc(rect, startAngle, sweep, false, basePaint);
    canvas.drawArc(rect, startAngle, sweep * 0.625, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MealCard extends StatelessWidget {
  const _MealCard({
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.calories,
    required this.goal,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  final String imageUrl;
  final String title;
  final String time;
  final String calories;
  final String goal;
  final String protein;
  final String carbs;
  final String fat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: KiraColors.surface,
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: KiraColors.shadow,
            blurRadius: 26,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF3F4F6), width: 2),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: const Color(0xFFE9E4DB));
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleMedium),
                    Text(time, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        calories.split(' ')[0],
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        'kcal',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    goal,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: KiraColors.accentDeep,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _MacroValue(label: 'Protein', value: protein),
              const SizedBox(width: 24),
              _MacroValue(label: 'Carbs', value: carbs),
              const SizedBox(width: 24),
              _MacroValue(label: 'Fat', value: fat),
              const Spacer(),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.edit_outlined,
                  size: 16,
                  color: KiraColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroValue extends StatelessWidget {
  const _MacroValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.bodySmall?.copyWith(fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.bodySmall?.copyWith(
            color: KiraColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
