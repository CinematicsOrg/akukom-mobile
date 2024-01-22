import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

class CreateFamilyUseCase
    implements UseCaseFuture<Failures, CreateFamilyEntity, CreateFamilyParam> {
  final FamilyGroupRepository familyGroupRepository;

  const CreateFamilyUseCase({required this.familyGroupRepository});

  @override
  Future<Either<Failures, CreateFamilyEntity>> call(
    CreateFamilyParam params,
  ) async {
    return await familyGroupRepository.createFamily(params);
  }
}

class CreateFamilyParam extends RequestParam {
  final String familyName;
  final String familyDescription;
  final XFile image;

  CreateFamilyParam({
    required this.familyName,
    required this.familyDescription,
    required this.image,
  });

  Future<MapEntry<String, http.MultipartFile>> toFileMapEntry() async {
    final mimeTypeData = lookupMimeType(image.path)?.split('/');
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

  Future<Map<String, String>> toFieldsMap() async {
    return {
      'name': familyName,
      'description': familyDescription,
    };
  }

  @override
  List<Object?> get props => [
        familyName,
        familyDescription,
        image,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'familyName': familyName,
      'familyDescription': familyDescription,
      'image': image,
    };
  }
}
