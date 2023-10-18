part of 'others.dart';

class Brain {
  static double interestCalculator(
    DateTime date,
    double amount,
    double interestRate,
  ) {
    double interestAmount = 0.0;
    final day = DateTime.now().day - date.day;
    final month = DateTime.now().month - date.month;
    final year = DateTime.now().year - date.year;

    double amountPerMonth = (amount / 100) * interestRate;

    interestAmount = ((day / 30) * amountPerMonth) +
        (month * amountPerMonth) +
        (12 * year * amountPerMonth);

    return interestAmount;
  }

  static double totalAmount(List<BarrowedData> data) {
    double sum = 0.0;
    for (int i = 0; i < data.length; i++) {
      sum += data[i].totalAmount;
    }
    return sum;
  }

  static double totalInterestAmount(List<BarrowedData> data) {
    double sum = 0.0;

    for (int i = 0; i < data.length; i++) {
      sum += data[i].interestAmount;
    }
    return sum;
  }

  static double totalBarrowedAmount(List<BarrowedData> data) {
    double sum = 0.0;

    for (int i = 0; i < data.length; i++) {
      sum += data[i].amount;
    }
    return sum;
  }

  static double totalBarrowings(List<BarrowedData> data) {
    return totalBarrowedAmount(data) + totalInterestAmount(data);
  }
}
