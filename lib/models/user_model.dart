import 'package:afya_bee/starter_models/user_model.g.dart';

/// * ---------- Auto Generated Code ---------- * ///

class UserModel extends UserModelGen {
  UserModel({
    int? id,
    String? avatar,
    String? fullName,
    String? phoneNumber,
    String? dateOfBirth,
    String? occupation,
    String? street,
    int? maritalStatus,
    int? gender,
    String? email,
    String? department,
    String? username,
    String? password,
    int? userRole,
    bool? isActive,
    String? lastLogin,
  }) : super(
         id,
         avatar,
         fullName,
         phoneNumber,
         dateOfBirth,
         occupation,
         street,
         maritalStatus,
         gender,
         email,
         department,
         username,
         password,
         userRole,
         isActive,
         lastLogin,
       );

  factory UserModel.fromDatabase(Map<String, dynamic> map) {
    return UserModelGen.fromDatabase(map);
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModelGen.fromJson(map);
  }

  Map<String, dynamic> get toJsonLogin {
    return {"email": email ?? username, "password": password};
  }
}
