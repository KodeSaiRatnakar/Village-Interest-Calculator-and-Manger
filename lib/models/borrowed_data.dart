part of 'models.dart';

@HiveType(typeId: 1)
class BarrowedData {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String phoneNumber;

  @HiveField(3)
  final double interestRate;

  @HiveField(4)
  final double amount;

  @HiveField(5)
  final DateTime date;

  @HiveField(6)
  final double amountPaidBack;

  @HiveField(7)
  final double interestAmount;

  @HiveField(8)
  final double totalAmount;

  const BarrowedData({
    required this.id,
    required this.name,
    required this.interestRate,
    required this.amount,
    required this.date,
    required this.interestAmount,
    required this.totalAmount,
    required this.amountPaidBack,
    required this.phoneNumber,
  });
}
