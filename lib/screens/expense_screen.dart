import 'package:expense_manager/enums/category_enums.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../widgets/chart.dart';
import '../widgets/expense_list.dart';
import 'new_expense.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  //dummy data
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: ExpenseCategory.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: ExpenseCategory.leisure,
    ),

    Expense(
      title: 'one',
      amount: 20,
      date: DateTime.now(),
      category: ExpenseCategory.leisure,
    ),

    Expense(
      title: 'two',
      amount: 22,
      date: DateTime.now(),
      category: ExpenseCategory.leisure,
    ),

    Expense(
      title: 'three',
      amount: 18,
      date: DateTime.now(),
      category: ExpenseCategory.leisure,
    ),
  ];
  // Get registered Expense Functions
  List<Expense> getRegisteredExpenses() {
    return _registeredExpenses;
  }

  void _openAddExpenseModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    //show undo option and insert if undo clicked
    //Snackbar
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Manager'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseModal,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BarChartSample8(
              expenseName: _registeredExpenses,
            ),
            ExpenseList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            )
          ],
        ),
      ),
    );
  }
}
