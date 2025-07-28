import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';
import './total_chart.dart';
import './category_list.dart';
import '../../screens/all_expenses.dart';

class CategoryFetcher extends StatefulWidget {
  const CategoryFetcher({super.key});

  @override
  State<CategoryFetcher> createState() => _CategoryFetcherState();
}

class _CategoryFetcherState extends State<CategoryFetcher>
    with TickerProviderStateMixin {
  late Future _categoryList;
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;

  Future _getCategoryList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchCategories();
  }

  @override
  void initState() {
    super.initState();
    _categoryList = _getCategoryList();
    _slideAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FutureBuilder(
      future: _categoryList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red.withOpacity(0.6),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Something went wrong',
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    snapshot.error.toString(),
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            _slideAnimationController.forward();
            return SlideTransition(
              position: _slideAnimation,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    children: [
                      // Enhanced Chart Section
                      Container(
                        height: 280,
                        margin: const EdgeInsets.only(bottom: 32),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const TotalChart(),
                      ),

                      // Header Section
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Categories',
                                  style:
                                      theme.textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Track your spending habits',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.textTheme.bodyMedium?.color
                                        ?.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: theme.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextButton.icon(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(AllExpenses.name);
                                },
                                icon: Icon(
                                  Icons.list_alt,
                                  color: theme.primaryColor,
                                  size: 18,
                                ),
                                label: Text(
                                  'View All',
                                  style: TextStyle(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Categories List
                      const Expanded(child: CategoryList()),
                    ],
                  ),
                ),
              ),
            );
          }
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(theme.primaryColor),
                    strokeWidth: 3,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Loading your expenses...',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
