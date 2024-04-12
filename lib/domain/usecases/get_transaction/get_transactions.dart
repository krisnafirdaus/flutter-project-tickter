import 'package:flutter_application_1/data/repositories/transaction_repository.dart';
import 'package:flutter_application_1/domain/entities/result.dart';
import 'package:flutter_application_1/domain/entities/transaction.dart';
import 'package:flutter_application_1/domain/usecases/get_transaction/get_transactions_param.dart';
import 'package:flutter_application_1/domain/usecases/usecase.dart';

class GetTransactions implements UseCase<Result<List<Transaction>>, GetTransactionsParam>{
  final TransactionRepository _transactionRepository;

  GetTransactions({required TransactionRepository transactionRepository}) : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionsParam params) async {
   var transactionListResult = await _transactionRepository.getUserTransactions(uid: params.uid);

   return switch(transactionListResult) {
      Success(value: final transactionList) => Result.success(transactionList),
      Failed(:final message) => Result.failed(message),
   };
  }
}