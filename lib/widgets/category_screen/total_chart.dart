import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';

class TotalChart extends StatefulWidget {
  const TotalChart({super.key});

  @override
  State<TotalChart> createState() => _TotalChartState();
}

class _TotalChartState extends State<TotalChart> with TickerProviderStateMixin {
  late AnimationController _chartAnimationController;
  late Animation<double> _chartAnimation;

  final List<Color> categoryColors = [
    const Color(0xFF6C63FF),
    const Color(0xFF00D2FF),
    const Color(0xFF3A8AFF),
    const Color(0xFF00BFA5),
    const Color(0xFFFF6B6B),
    const Color(0xFFFFD93D),
  ];

  @override
  void initState() {
    super.initState();
    _chartAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _chartAnimation = CurvedAnimation(
      parent: _chartAnimationController,
      curve: Curves.easeOutCubic,
    );
    _chartAnimationController.forward();
  }

  @override
  void dispose() {
    _chartAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var list = db.categories;
        var total = db.calculateTotalExpenses();

        return AnimatedBuilder(
          animation: _chartAnimation,
          builder: (context, child) {
            return LayoutBuilder(
              builder: (context, constraints) {
                // Responsive layout based on screen width
                bool isTablet = constraints.maxWidth > 600;

                return Row(
                  children: [
                    // Left side - Details
                    Expanded(
                      flex: isTablet
                          ? 60
                          : 65, // Increased flex to give more space for text
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Total Amount with Icon
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(isTablet ? 20 : 16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  theme.primaryColor.withOpacity(0.1),
                                  theme.primaryColor.withOpacity(0.05),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: theme.primaryColor.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.account_balance_wallet,
                                      color: theme.primaryColor,
                                      size: isTablet ? 24 : 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Total Balance',
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color: theme.primaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: isTablet ? 16 : 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: isTablet ? 12 : 8),
                                FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    NumberFormat.currency(
                                      locale: 'fr_RW',
                                      symbol: 'FRw',
                                      decimalDigits: 0,
                                    ).format(total * _chartAnimation.value),
                                    style: theme.textTheme.headlineMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: isTablet ? 26 : 22,
                                      color: theme.brightness == Brightness.dark
                                          ? Colors.white
                                          : theme.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: isTablet ? 16 : 12),

                          // Category breakdown - Make it scrollable if needed
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: list.map((e) {
                                  final index = list.indexOf(e);
                                  final color = categoryColors[
                                      index % categoryColors.length];
                                  final percentage = total == 0
                                      ? 0.0
                                      : (e.totalAmount / total) * 100;

                                  return Container(
                                    margin: EdgeInsets.only(
                                        bottom: isTablet ? 8 : 6),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isTablet ? 12 : 10,
                                      vertical: isTablet ? 10 : 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: color.withOpacity(0.08),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: color.withOpacity(0.2),
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: isTablet ? 8 : 6,
                                          height: isTablet ? 8 : 6,
                                          decoration: BoxDecoration(
                                            color: color,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: isTablet ? 10 : 8),
                                        Expanded(
                                          child: Text(
                                            e.title,
                                            style: theme.textTheme.bodySmall
                                                ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: isTablet ? 13 : 11,
                                              color: theme.brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                      .withOpacity(0.9)
                                                  : theme.textTheme.bodySmall
                                                      ?.color,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: isTablet ? 6 : 4,
                                            vertical: isTablet ? 3 : 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: color.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            '${(percentage * _chartAnimation.value).toStringAsFixed(1)}%',
                                            style: theme.textTheme.bodySmall
                                                ?.copyWith(
                                              color: color,
                                              fontWeight: FontWeight.bold,
                                              fontSize: isTablet ? 10 : 9,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: isTablet ? 16 : 12),

                    // Right side - Pie Chart
                    Expanded(
                      flex: isTablet
                          ? 40
                          : 35, // Reduced flex to give more space to left side
                      child: Container(
                        height: isTablet ? 200 : 180,
                        child: total != 0
                            ? PieChart(
                                PieChartData(
                                  centerSpaceRadius: isTablet ? 45 : 35,
                                  sectionsSpace: 2,
                                  sections: list.map((e) {
                                    final index = list.indexOf(e);
                                    final color = categoryColors[
                                        index % categoryColors.length];
                                    return PieChartSectionData(
                                      showTitle: false,
                                      value:
                                          e.totalAmount * _chartAnimation.value,
                                      color: color,
                                      radius: isTablet ? 50 : 45,
                                    );
                                  }).toList(),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: theme.dividerColor,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.pie_chart_outline,
                                        size: isTablet ? 36 : 28,
                                        color: theme.textTheme.bodyMedium?.color
                                            ?.withOpacity(0.5),
                                      ),
                                      SizedBox(height: isTablet ? 8 : 6),
                                      Text(
                                        'No Data',
                                        style:
                                            theme.textTheme.bodySmall?.copyWith(
                                          color: theme
                                              .textTheme.bodyMedium?.color
                                              ?.withOpacity(0.5),
                                          fontSize: isTablet ? 12 : 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
