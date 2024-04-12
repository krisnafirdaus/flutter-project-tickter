
import 'package:flutter_application_1/data/firebase/firebase_transaction_repository.dart';
import 'package:flutter_application_1/data/repositories/transaction_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_repository_provider.g.dart';

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) => FirebaseTransactionRepository();