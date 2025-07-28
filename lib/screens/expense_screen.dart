import 'package:flutter/material.dart';
import '../widgets/expense_screen/expense_fetcher.dart';
import '../constants/icons.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});
  static const name = '/expense_screen';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final category = ModalRoute.of(context)!.settings.arguments as String;

    final List<Color> categoryColors = [
      const Color(0xFF6C63FF),
      const Color(0xFF00D2FF),
      const Color(0xFF3A8AFF),
      const Color(0xFF00BFA5),
      const Color(0xFFFF6B6B),
      const Color(0xFFFFD93D),
    ];

    Color getCategoryColor() {
      final index = category.hashCode.abs() % categoryColors.length;
      return categoryColors[index];
    }

    final categoryColor = getCategoryColor();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: categoryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icons[category],
                color: categoryColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                category,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [
                    const Color(0xFF1A1A1A),
                    const Color(0xFF2D2D2D),
                  ]
                : [
                    const Color(0xFFF8F9FA),
                    const Color(0xFFE9ECEF),
                  ],
          ),
        ),
        child: ExpenseFetcher(category),
      ),
    );
  }
}
