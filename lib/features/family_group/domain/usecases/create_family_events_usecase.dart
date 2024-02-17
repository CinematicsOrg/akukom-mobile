import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

class CreateFamilyEventUseCase
    implements UseCaseFuture<Failures, BaseEntity, CreateFamilyEventsParams> {
  final FamilyGroupRepository repository;

  const CreateFamilyEventUseCase({required this.repository});

  @override
  Future<Either<Failures, BaseEntity>> call(
    CreateFamilyEventsParams params,
  ) async {
    return await repository.createFamilyEvent(params);
  }
}

class CreateFamilyEventsParams extends RequestParam {
  final XFile image;
  final String name;
  final DateTime startDate;
  final DateTime stopDate;
  final String id;
  final String location;
  CreateFamilyEventsParams({
    required this.image,
    required this.name,
    required this.startDate,
    required this.stopDate,
    required this.id,
    required this.location,
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
      'name': name,
      'startDate': startDate.toIso8601String(),
      'stopDate': stopDate.toIso8601String(),
      'location': location,
    };
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'startDate': startDate,
      'stopDate': stopDate,
      'location': location,
    };
  }

  @override
  List<Object?> get props => [
        image,
        name,
        startDate,
        stopDate,
        id,
        location,
      ];

  @override
  bool? get stringify => true;
}
