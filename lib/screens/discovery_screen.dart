import 'package:flutter/material.dart';

import '../theme/kira_theme.dart';
import '../widgets/kira_common.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({
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
                      padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 68,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 68,
                                        padding: const EdgeInsets.fromLTRB(
                                          52,
                                          0,
                                          0,
                                          0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: KiraColors.shadow,
                                              blurRadius: 4,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Search',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                color: const Color(0xFF9CA3AF),
                                              ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Container(
                                      height: 68,
                                      width: 68,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: KiraColors.shadow,
                                            blurRadius: 4,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          const Center(
                                            child: Icon(
                                              Icons.notifications_none_rounded,
                                              size: 24,
                                              color: KiraColors.textPrimary,
                                            ),
                                          ),
                                          Positioned(
                                            top: 24,
                                            right: 22,
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF97316),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Search icon overlay
                                Positioned(
                                  top: 9,
                                  left: 0,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: KiraColors.shadow,
                                          blurRadius: 4,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.search_rounded,
                                      size: 24,
                                      color: KiraColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _CategoryCard(
                                  label: 'All',
                                  imageUrl:
                                      'https://www.figma.com/api/mcp/asset/0e30cd40-3d8d-465d-b64f-028c9f91af2f',
                                ),
                                const SizedBox(width: 16),
                                _CategoryCard(
                                  label: 'Vegan',
                                  imageUrl:
                                      'https://www.figma.com/api/mcp/asset/f6708c46-8699-4d2a-b642-77475ec75647',
                                ),
                                const SizedBox(width: 16),
                                _CategoryCard(
                                  label: 'Protein',
                                  imageUrl:
                                      'https://www.figma.com/api/mcp/asset/45df0a4a-f494-47c2-8389-fdce18466787',
                                ),
                                const SizedBox(width: 16),
                                _CategoryCard(
                                  label: 'Snacks',
                                  imageUrl:
                                      'https://www.figma.com/api/mcp/asset/e51fe87e-9bdd-4f76-9e29-b8ac4ecae5ef',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              Text(
                                'Trending Recipes',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFED7AA),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: const Text(
                                  '8',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFEA580C),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'See All',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFF9CA3AF),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: KiraColors.surface,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: const [
                                  BoxShadow(
                                    color: KiraColors.shadow,
                                    blurRadius: 25,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Quinoa Veggie Bowl',
                                              style: theme.textTheme.titleLarge
                                                  ?.copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons
                                                      .access_time_filled_rounded,
                                                  size: 20,
                                                  color: Color(0xFF6B7280),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  '45 min',
                                                  style: theme
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        color: const Color(
                                                          0xFF6B7280,
                                                        ),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(
                                        Icons.star_rounded,
                                        color: KiraColors.dark,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 302,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: KiraColors.shadow,
                                          blurRadius: 25,
                                          offset: Offset(0, 10),
                                        ),
                                      ],
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        'https://www.figma.com/api/mcp/asset/7c645387-8c2b-459a-9698-032af5193cdd',
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                color: const Color(0xFFE9E4DB),
                                              );
                                            },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          color: const Color(0xFFF3F4F6),
                                        ),
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(top: 1),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Easy',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                color: const Color(0xFF6B7280),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                        ),
                                        const SizedBox(width: 12),
                                        const _DifficultyBars(),
                                        const Spacer(),
                                        Container(
                                          height: 32,
                                          width: 1,
                                          color: const Color(0xFFE5E7EB),
                                        ),
                                        const SizedBox(width: 12),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '750',
                                              style: theme
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(
                                                    fontSize: 36,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'kcal',
                                              style: theme.textTheme.bodyLarge
                                                  ?.copyWith(
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.label, required this.imageUrl});

  final String label;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: KiraColors.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: KiraColors.shadow,
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFE9E4DB),
                  child: const Icon(Icons.restaurant_menu_rounded),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: const Color(0xFF1F2937),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _DifficultyBars extends StatelessWidget {
  const _DifficultyBars();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Container(
          margin: EdgeInsets.only(right: index == 4 ? 0 : 4),
          width: 12,
          height: 34,
          decoration: BoxDecoration(
            color: index < 2
                ? const Color(0xFFFB923C)
                : index == 2
                ? const Color(0xFFFB923C).withValues(alpha: 0.6)
                : const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
    );
  }
}
