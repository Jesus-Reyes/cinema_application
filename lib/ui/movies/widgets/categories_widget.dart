import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simple model for category
class Category {
  final String name;
  final IconData icon;

  const Category({required this.name, required this.icon});
}

// Provider for selected category
final selectedCategoryProvider = StateProvider<int>((ref) => 0);

// Provider for categories list
final categoriesProvider = Provider<List<Category>>((ref) => [
      const Category(name: 'Horror', icon: Icons.sentiment_very_dissatisfied),
      const Category(name: 'Romance', icon: Icons.favorite),
      const Category(name: 'Comedy', icon: Icons.sentiment_very_satisfied),
      const Category(name: 'Action', icon: Icons.local_fire_department),
      const Category(name: 'Drama', icon: Icons.theater_comedy),
      const Category(name: 'Fantasy', icon: Icons.auto_awesome),
    ]);

class CategoriesWidget extends ConsumerWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    final selectedIndex = ref.watch(selectedCategoryProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to all categories page
                },
                child: Row(
                  children: [
                    Text(
                      'See all',
                      style: TextStyle(
                        color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  ref.read(selectedCategoryProvider.notifier).state = index;
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.7)
                        : isDarkMode
                            ? Colors.grey[850]
                            : Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        categories[index].icon,
                        color: isSelected
                            ? Colors.white
                            : isDarkMode
                                ? Colors.yellow
                                : Colors.orange,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
