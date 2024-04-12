import 'package:flutter_application_1/data/repositories/authentication.dart';
import 'package:flutter_application_1/domain/entities/result.dart';
import 'package:flutter_application_1/domain/usecases/usecase.dart';

class Logout implements UseCase<void, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication}) : _authentication = authentication;

  @override
  Future<Result<void>> call(void _) {
    return _authentication.logout();
  }
}