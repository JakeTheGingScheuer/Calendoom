import 'package:test_driving/models/day_transaction.dart';
import 'day.dart';
import 'month.dart';

class ReoccurringPayments {
  List<Month> monthList;
  List<Transaction> reoccurringPayments;

  ReoccurringPayments(this.monthList){
    reoccurringPayments = new List<Transaction>();
  }

  update(){
    findAllReoccurringPayments();
    populateReoccurringPaymentsInCalendar();
    return monthList;
  }

  findAllReoccurringPayments(){
    monthList.forEach((month)=>
        month.days.forEach((day)=>
            day.transactions.forEach((trans)=>
                checkIfReoccurring(trans))));
  }

  checkIfReoccurring(Transaction trans){
    if(trans.isReoccurring){
      addToReoccurringPaymentList(trans);
    }
  }

  addToReoccurringPaymentList(Transaction trans){
    trans.setIsReoccurring(false);
    reoccurringPayments.add(trans);
  }

  populateReoccurringPaymentsInCalendar(){
    monthList.forEach((month)=>
        month.days.forEach((day)=>
            checkReoccurringPaymentDates(day)));
  }

  checkReoccurringPaymentDates(Day calendar){
    reoccurringPayments.forEach((payment)=>
        addPaymentToFutureDates(payment, calendar));
  }

  addPaymentToFutureDates(Transaction payment, Day dayOfMonth){
    bool yearIsInFuture = dayOfMonth.date.year > payment.date.year;
    bool monthIsInFuture = dayOfMonth.date.monthNumber > payment.date.monthNumber;

    if(yearIsInFuture || monthIsInFuture){
      addPaymentIfSameDayOfTheMonth(payment, dayOfMonth);
    }
  }

  addPaymentIfSameDayOfTheMonth(Transaction payment, Day dayOfMonth){
    if(dayOfMonth.date.dayNumber == payment.date.dayNumber){
      dayOfMonth.addTransaction(payment);
    }
  }
}