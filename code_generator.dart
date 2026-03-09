import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

void main() {
  List<BaseModelGenerator> generator = [_User()];
  CodeGenerator.of('afya_bee', generator).generate();
}

class _User extends BaseModelGenerator {
  _User()
    : super.database('user', {
        'id': int,
        'avatar': String,
        'fullName': String,
        'phoneNumber': String,
        'dateOfBirth': String,
        'occupation': String,
        'street': String,
        'maritalStatus': int,
        'gender': int,
        'email': String,
        'department': String,
        'username': String,
        "password": String,
        'userRole': int,
        'isActive': bool,
        'lastLogin': String,
      });
}
