import 'package:flutter/material.dart';

import '../theme/kira_theme.dart';

class KiraBottomNav extends StatelessWidget {
  const KiraBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
      decoration: const BoxDecoration(
        color: KiraColors.dark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavButton(
            icon: Icons.home_rounded,
            isSelected: selectedIndex == 0,
            onTap: () => onSelected(0),
          ),
          _NavButton(
            icon: Icons.description_outlined,
            isSelected: selectedIndex == 1,
            onTap: () => onSelected(1),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: KiraColors.accent,
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(Icons.crop_square_rounded, color: KiraColors.dark),
            ),
          ),
          const _NavButton(icon: Icons.star_rounded, isSelected: false),
          const _NavButton(icon: Icons.settings_rounded, isSelected: false),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

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
