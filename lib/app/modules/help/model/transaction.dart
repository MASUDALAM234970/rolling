// ==================== MODEL ====================
class Transaction {
  final String name;
  final String time;
  final double amount;
  final bool isExpense;

  Transaction({
    required this.name,
    required this.time,
    required this.amount,
    required this.isExpense,
  });
}
