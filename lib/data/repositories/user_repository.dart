import 'dart:io';

import 'package:flutter_application_1/domain/entities/result.dart';
import 'package:flutter_application_1/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  });

  Future<Result<User>> getUser({required String uid});
  Future<Result<User>> updateUser({required User user});
  Future<Result<int>> getUserBalance({required String uid});
  Future<Result<User>> updateUserBalance({required String uid, required int balance});
  Future<Result<User>> uploadProfilePicture({ required File imageFile, required User user});
}