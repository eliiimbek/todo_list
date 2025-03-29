import 'package:flutter/material.dart';
import 'package:todo_list/models/task_category.dart';

final categories = [
  TaskCategory(
    id: 'all_tasks',
    categoryTitle: 'All tasks',
    icon: Icons.list_alt_outlined,
  ),
  TaskCategory(
    id: 'work',
    categoryTitle: 'Work',
    icon: Icons.monetization_on_outlined,
  ),
  TaskCategory(
    id: 'study',
    categoryTitle: 'Study',
    icon: Icons.school_outlined,
  ),
  TaskCategory(
    id: 'purchases',
    categoryTitle: 'Purchases',
    icon: Icons.shopping_cart_outlined,
  ),
  TaskCategory(
    id: 'workout',
    categoryTitle: 'Workout',
    icon: Icons.sports_basketball_outlined,
  ),
  TaskCategory(
    id: 'entertainment',
    categoryTitle: 'Entertainment',
    icon: Icons.sports_esports_outlined,
  ),
];
