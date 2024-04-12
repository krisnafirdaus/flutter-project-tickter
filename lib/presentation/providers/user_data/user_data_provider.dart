import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/domain/entities/result.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:flutter_application_1/domain/usecases/login/login.dart';
import 'package:flutter_application_1/domain/usecases/register/register.dart';
import 'package:flutter_application_1/domain/usecases/register/register_param.dart';
import 'package:flutter_application_1/domain/usecases/top_up/top_up.dart';
import 'package:flutter_application_1/domain/usecases/upload_profile_picture/upload_profile_picture.dart';
import 'package:flutter_application_1/domain/usecases/upload_profile_picture/upload_profile_picture_paran.dart';
import 'package:flutter_application_1/presentation/providers/movie/now_playing_provider.dart';
import 'package:flutter_application_1/presentation/providers/movie/upcoming_provider.dart';
import 'package:flutter_application_1/presentation/providers/transaction_date/transaction_data_provider.dart';
import 'package:flutter_application_1/presentation/providers/usecases/get_logged_in_user_provider.dart';
import 'package:flutter_application_1/presentation/providers/usecases/login_provider.dart';
import 'package:flutter_application_1/presentation/providers/usecases/register_provider.dart';
import 'package:flutter_application_1/presentation/providers/usecases/top_up_provider.dart';
import 'package:flutter_application_1/presentation/providers/usecases/upload_profile_picture_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<User?> build() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);
    var userResult  = await getLoggedInUser(null);

    switch(userResult){
      case Success(value: final user): _getMovies(); return user;
      case Failed(message: _): return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
   state = const AsyncLoading();

   Login login = ref.read(loginProvider);

   var result = await login(LoginParams(email: email, password: password));

   switch(result){
     case Success(value: final user): _getMovies(); state = AsyncData(user);
     case Failed(message: final message): state = AsyncError(FlutterError(message), StackTrace.current); state = const AsyncData(null);
   }
  }

  Future<void> register({ required String email, required String password, required String name, String? imageUrl}) async {
    state = const AsyncLoading();

    Register register = ref.read(registerProvider);

    var result = await register(RegisterParam(email: email, password: password, name: name, photoUrl: imageUrl));

    switch(result){
      case Success(value: final user): _getMovies(); state = AsyncData(user);
      case Failed(message: final message): state = AsyncError(FlutterError(message), StackTrace.current); state = const AsyncData(null);
    }
  }

  Future<void> refreshUserData() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);
    var result  = await getLoggedInUser(null);

    if(result case Success(value: final user)) {
      state = AsyncData(user);
    }
  }

  Future<void> logout() async {
   var logout = ref.read(getLoggedInUserProvider);
   var result = await logout(null);

   switch(result){
     case Success(value: final user): state = const AsyncData(null);
     case Failed(message: final message): state = AsyncError(FlutterError(message), StackTrace.current); state = const AsyncData(null);
   }
  }

  Future<void> topUp(int amount) async {
    TopUp topUp = ref.read(topUpProvider);

    String? userId = state.valueOrNull?.uid;

    if(userId != null){
      refreshUserData();
      ref.read(transactionDataProvider.notifier).refreshTransactionData();
    }
    
  }

  Future<void> uploadProfilePicture({required User user, required File imageFile}) async {
    UploadProfilePicture uploadProfilePicture = ref.read(uploadProfilePictureProvider);

    var result = await uploadProfilePicture(UploadProfilePictureParam(user: user, imageFile: imageFile));

    if(result case Success(value: final user)){
      state = AsyncData(user);
    }
  }

  void _getMovies(){
    ref.read(nowPlayingProvider.notifier).getMovies();
    ref.read(upcomingProvider.notifier).getMovies();
  }
}