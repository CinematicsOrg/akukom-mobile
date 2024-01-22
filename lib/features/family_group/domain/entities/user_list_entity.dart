import 'package:equatable/equatable.dart';

class UserListEntity extends Equatable {
  final UserListDataEntity? data;

  const UserListEntity({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}

class UserListDataEntity extends Equatable {
  final List<UsersListDocEntity>? docs;
  final int? totalDocs;
  final int? offset;
  final int? limit;
  final int? totalPages;
  final int? page;
  final int? pagingCounter;
  final bool? hasPrevPage;
  final bool? hasNextPage;
  final dynamic prevPage;
  final int? nextPage;

  const UserListDataEntity({
    this.docs,
    this.totalDocs,
    this.offset,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  @override
  List<Object?> get props => [
        docs,
        totalDocs,
        offset,
        limit,
        totalPages,
        page,
        pagingCounter,
        hasPrevPage,
        hasNextPage,
        prevPage,
        nextPage,
      ];
}

class UsersListDocEntity extends Equatable {
  final bool? hasVerifiedEmail;
  final String? status;
  final List<dynamic>? family;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? hasVerifiedPhone;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? id;
  final String? country;
  final String? phone;

  const UsersListDocEntity({
    this.hasVerifiedEmail,
    this.status,
    this.family,
    this.firstName,
    this.lastName,
    this.email,
    this.hasVerifiedPhone,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.country,
    this.phone,
  });

  @override
  List<Object?> get props => [
        hasVerifiedEmail,
        status,
        family,
        firstName,
        lastName,
        email,
        hasVerifiedPhone,
        password,
        createdAt,
        updatedAt,
        id,
        country,
        phone,
      ];
}
