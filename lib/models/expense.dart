import 'package:expense_manager/enums/category_enums.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd(); //our formatter

const categoryIcons = {
  ExpenseCategory.food: Icons.lunch_dining,
  ExpenseCategory.travel: Icons.airport_shuttle,
  ExpenseCategory.leisure: Icons.movie,
  ExpenseCategory.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  //getter method
  String get formattedDate {
    return formatter.format(date);
  }

  String get getTitle {
    return title;
  }
}
