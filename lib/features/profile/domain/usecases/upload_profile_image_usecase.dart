
import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase_interface.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:path/path.dart';

class UploadProfileImageUseCase
    extends UseCaseFuture<Failures, EditProfileEntity, RequestParam> {
  final ProfileRepository profileRepository;

  UploadProfileImageUseCase({required this.profileRepository});

  @override
  Future<Either<Failures, EditProfileEntity>> call(RequestParam params) async {
    return await profileRepository.uploadProfilePicture(params);
  }
}

class UploadProfileImageParams extends RequestParam {
  final XFile image;

  UploadProfileImageParams({required this.image});

  Future<MapEntry<String, http.MultipartFile>> toFileMapEntry() async {
    // Determine the mime type of the file
    final mimeTypeData = lookupMimeType(image.path)?.split('/');
    // Create a MultipartFile from the XFile path
    final file = await http.MultipartFile.fromPath(
      'file',
      image.path,
      filename: basename(image.path),
      contentType: mimeTypeData != null
          ? MediaType(mimeTypeData[0], mimeTypeData[1])
          : null,
    );

    return MapEntry('file', file);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'file': image,
    };
  }

  @override
  List<Object?> get props => [
        image,
      ];

  @override
  bool? get stringify => true;
}
