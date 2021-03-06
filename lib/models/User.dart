/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String username;
  final String email;
  final bool isMember;
  final String userProgress;
  final String userLevel;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const User._internal(
      {@required this.id,
      @required this.username,
      this.email,
      this.isMember,
      this.userProgress,
      this.userLevel});

  factory User(
      {String id,
      @required String username,
      String email,
      bool isMember,
      String userProgress,
      String userLevel}) {
    return User._internal(
        id: id == null ? UUID.getUUID() : id,
        username: username,
        email: email,
        isMember: isMember,
        userProgress: userProgress,
        userLevel: userLevel);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        username == other.username &&
        email == other.email &&
        isMember == other.isMember &&
        userProgress == other.userProgress &&
        userLevel == other.userLevel;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$username" + ", ");
    buffer.write("email=" + "$email" + ", ");
    buffer.write(
        "isMember=" + (isMember != null ? isMember.toString() : "null") + ", ");
    buffer.write("userProgress=" + "$userProgress" + ", ");
    buffer.write("userLevel=" + "$userLevel");
    buffer.write("}");

    return buffer.toString();
  }

  User copyWith(
      {String id,
      String username,
      String email,
      bool isMember,
      String userProgress,
      String userLevel}) {
    return User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        isMember: isMember ?? this.isMember,
        userProgress: userProgress ?? this.userProgress,
        userLevel: userLevel ?? this.userLevel);
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        email = json['email'],
        isMember = json['isMember'],
        userProgress = json['userProgress'],
        userLevel = json['userLevel'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'isMember': isMember,
        'userProgress': userProgress,
        'userLevel': userLevel
      };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField USERNAME = QueryField(fieldName: "username");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField ISMEMBER = QueryField(fieldName: "isMember");
  static final QueryField USERPROGRESS = QueryField(fieldName: "userProgress");
  static final QueryField USERLEVEL = QueryField(fieldName: "userLevel");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.USERNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.ISMEMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.USERPROGRESS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.USERLEVEL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();

  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}
