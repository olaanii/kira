import 'package:flutter/material.dart';

import '../theme/kira_theme.dart';

class KiraTopPill extends StatelessWidget {
  const KiraTopPill({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 14,
        width: 78,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class KiraIconSquareButton extends StatelessWidget {
  const KiraIconSquareButton({
    super.key,
    required this.icon,
    this.size = 46,
    this.backgroundColor = KiraColors.surface,
    this.iconColor = KiraColors.textPrimary,
  });

  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: KiraColors.shadow,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Icon(icon, size: 20, color: iconColor),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.trailing,
  });

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const Spacer(),
        trailing ?? const SizedBox.shrink(),
      ],
    );
  }
}
