import 'package:flutter_application_1/data/repositories/user_repository.dart';
import 'package:flutter_application_1/domain/entities/result.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/domain/usecases/upload_profile_picture/upload_profile_picture_paran.dart';
import 'package:flutter_application_1/domain/usecases/usecase.dart';

class UploadProfilePicture implements UseCase<Result<User>, UploadProfilePictureParam> {
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Future<Result<User>> call(UploadProfilePictureParam params) => _userRepository.uploadProfilePicture(imageFile: params.imageFile, user: params.user);
}