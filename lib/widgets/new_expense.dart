// import 'package:flutter/material.dart';

// import 'package:expense_tracker_app/models/expense.dart';

// // final formatter = DateFormat.yMd();

// class NewExpense extends StatefulWidget {
//   const NewExpense({super.key, required this.onAddExpense});

//   final Function(Expense expense) onAddExpense;

//   @override
//   State<NewExpense> createState() => _NewExpenseState();
// }

// class _NewExpenseState extends State<NewExpense> {
//   final _titleController = TextEditingController();
//   final _amountController = TextEditingController();
//   DateTime? _selectedDate;
//   Category _selectedCategory = Category.food;

//   void _presentDatePicker() async {
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2022),
//       lastDate: DateTime.now(),
//     );
//     setState(() {
//       _selectedDate = pickedDate;
//     });
//   }

//   void _submitExpenseData() {
//     final enteredAmount = double.tryParse(_amountController.text);
//     final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
//     if (_titleController.text.trim().isEmpty ||
//         amountIsInvalid ||
//         _selectedDate == null) {
//       showDialog(
//           context: context,
//           builder: (ctx) => AlertDialog(
//                 title: const Text('Invalid input'),
//                 content: const Text(
//                     'Please make sure a valid title, amount, date and category was entered.'),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(ctx);
//                     },
//                     child: const Text('Okay'),
//                   ),
//                 ],
//               ));
//       return;
//     }
//     widget.onAddExpense(
//       Expense(
//         title: _titleController.text,
//         amount: enteredAmount,
//         date: _selectedDate!,
//         category: _selectedCategory,
//       ),
//     );
//     Navigator.pop(context);
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _amountController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

//     return LayoutBuilder(builder: (ctx, constraints) {
//       final width = constraints.maxWidth;

//       return SizedBox(
//         height: double.infinity,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
//             child: Column(
//               children: [
//                 if (width >= 600)
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: _titleController,
//                           maxLength: 50,
//                           decoration: const InputDecoration(
//                             labelText: 'Title',
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 24),
//                       Expanded(
//                         child: TextField(
//                           controller: _amountController,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             prefixText: '\$ ',
//                             labelText: 'Amount',
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 else
//                   TextField(
//                     controller: _titleController,
//                     maxLength: 50,
//                     decoration: const InputDecoration(
//                       labelText: 'Title',
//                     ),
//                   ),
//                 if (width >= 600)
//                   Row(children: [
//                     DropdownButton(
//                       value: _selectedCategory,
//                       items: Category.values
//                           .map((category) => DropdownMenuItem(
//                               value: category,
//                               child: Text(category.name.toUpperCase())))
//                           .toList(),
//                       onChanged: (value) {
//                         if (value == null) return;
//                         setState(() {
//                           _selectedCategory = value;
//                         });
//                       },
//                     ),
//                     const SizedBox(width: 24),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(_selectedDate == null
//                               ? 'No date selected'
//                               : formatter.format(_selectedDate!)),
//                           IconButton(
//                             onPressed: _presentDatePicker,
//                             icon: const Icon(Icons.calendar_month),
//                           )
//                         ],
//                       ),
//                     ),
//                   ])
//                 else
//                   Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: _amountController,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             prefixText: '\$ ',
//                             labelText: 'Amount',
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(_selectedDate == null
//                                 ? 'No date selected'
//                                 : formatter.format(_selectedDate!)),
//                             IconButton(
//                               onPressed: _presentDatePicker,
//                               icon: const Icon(Icons.calendar_month),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 const SizedBox(height: 16),
//                 if (width >= 600)
//                   Row(
//                     children: [
//                       const Spacer(),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('Cancel'),
//                       ),
//                       ElevatedButton(
//                         onPressed: _submitExpenseData,
//                         child: const Text('Save Expense'),
//                       ),
//                     ],
//                   )
//                 else
//                   Row(
//                     children: [
//                       DropdownButton(
//                         value: _selectedCategory,
//                         items: Category.values
//                             .map((category) => DropdownMenuItem(
//                                 value: category,
//                                 child: Text(category.name.toUpperCase())))
//                             .toList(),
//                         onChanged: (value) {
//                           if (value == null) return;
//                           setState(() {
//                             _selectedCategory = value;
//                           });
//                         },
//                       ),
//                       const Spacer(),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('Cancel'),
//                       ),
//                       ElevatedButton(
//                         onPressed: _submitExpenseData,
//                         child: const Text('Save Expense'),
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  static const double _widthThreshold = 600;
  static const EdgeInsets _contentPadding = EdgeInsets.fromLTRB(16, 24, 16, 16);

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateFormatter = DateFormat.yMd();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      widget.onAddExpense(
        Expense(
          title: _titleController.text,
          amount: double.parse(_amountController.text),
          date: _selectedDate!,
          category: _selectedCategory,
        ),
      );
      Navigator.pop(context);
    } else {
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invalid input'),
        content: const Text(
            'Please make sure a valid title, amount, date and category was entered.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;
      final isWideLayout = width >= _widthThreshold;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                _contentPadding.left,
                _contentPadding.top,
                _contentPadding.right,
                keyboardSpace + _contentPadding.bottom),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (isWideLayout)
                    _buildWideInputFields()
                  else
                    _buildNarrowInputFields(),
                  const SizedBox(height: 16),
                  if (isWideLayout)
                    _buildWideCategoryAndDateRow()
                  else
                    _buildNarrowCategoryAndDateRow(),
                  const SizedBox(height: 16),
                  _buildActionButtons(isWideLayout),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildWideInputFields() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildTitleField()),
        const SizedBox(width: 24),
        Expanded(child: _buildAmountField()),
      ],
    );
  }

  Widget _buildNarrowInputFields() {
    return Column(
      children: [
        _buildTitleField(),
        const SizedBox(height: 16),
        _buildAmountField(),
      ],
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: _titleController,
      maxLength: 50,
      decoration: const InputDecoration(labelText: 'Title'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a title';
        }
        return null;
      },
    );
  }

  Widget _buildAmountField() {
    return TextFormField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        prefixText: '\$ ',
        labelText: 'Amount',
      ),
      validator: (value) {
        if (value == null ||
            double.tryParse(value) == null ||
            double.parse(value) <= 0) {
          return 'Please enter a valid positive number';
        }
        return null;
      },
    );
  }

  Widget _buildWideCategoryAndDateRow() {
    return Row(
      children: [
        _buildCategoryDropdown(),
        const SizedBox(width: 24),
        Expanded(child: _buildDatePicker()),
      ],
    );
  }

  Widget _buildNarrowCategoryAndDateRow() {
    return Column(
      children: [
        _buildCategoryDropdown(),
        const SizedBox(height: 16),
        _buildDatePicker(),
      ],
    );
  }

  Widget _buildCategoryDropdown() {
    return DropdownButton<Category>(
      value: _selectedCategory,
      items: Category.values
          .map((category) => DropdownMenuItem(
              value: category, child: Text(category.name.toUpperCase())))
          .toList(),
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          _selectedCategory = value;
        });
      },
    );
  }

  Widget _buildDatePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(_selectedDate == null
            ? 'No date selected'
            : _dateFormatter.format(_selectedDate!)),
        IconButton(
          onPressed: _presentDatePicker,
          icon: const Icon(Icons.calendar_month),
        )
      ],
    );
  }

  Widget _buildActionButtons(bool isWideLayout) {
    final buttons = [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: _submitExpenseData,
        child: const Text('Save Expense'),
      ),
    ];

    return isWideLayout
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: buttons,
          )
        : Row(
            children: [
              const Spacer(),
              ...buttons,
            ],
          );
  }
}
