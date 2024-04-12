import 'package:flutter_application_1/data/firebase/firebase_authentication.dart';
import 'package:flutter_application_1/data/repositories/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(AuthenticationRef ref) => FirebaseAuthentication(); 