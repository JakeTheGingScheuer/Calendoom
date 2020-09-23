import 'package:test_driving/models/month.dart';
import 'package:test_driving/models/reoccurring_payments.dart';

class BalanceCalculator{
  List<Month> calendar;
  ReoccurringPayments reoccurringPayments;
  List<double> endOfMonthBalances;

  BalanceCalculator(this.calendar){
    reoccurringPayments = ReoccurringPayments(calendar);
    calculateBalance();
  }

  calculateBalance(){
    calendar = reoccurringPayments.update();
    calculateAllDailyBalances(calendar);
    setEndOfMonthBalances();
    for(int i = 1; i < calendar.length; i++){
      carryBalanceBetweenMonths(i);
      setEndOfMonthBalances();
      updateMonthWithPreviousMonthsBalance(i);
    }
  }

  calculateAllDailyBalances(List<Month> calendar){
    calendar.forEach((month) =>
        month.days.forEach((day) =>
            day.calculateBalance()));
  }

  setEndOfMonthBalances(){
    endOfMonthBalances = new List<double>();
    calendar.forEach((month) => month.setEndOfMonthBalance());
    calendar.forEach((month) => endOfMonthBalances.add(month.endOfMonthBalance));
  }
  carryBalanceBetweenMonths(int i){
    calendar[i].setBeginningBalance(endOfMonthBalances[i-1]);
  }
  updateMonthWithPreviousMonthsBalance(int i){
    calendar[i].days.forEach((day) => day.calculateBalance());
  }
}