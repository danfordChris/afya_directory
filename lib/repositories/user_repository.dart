import 'package:afya_bee/repositories/base_repository.dart';
import 'package:afya_bee/models/user_model.dart';

/// * ---------- Auto Generated Code ---------- * ///

class UserRepository extends BaseRepository<UserModel> {
	UserRepository._(): super(UserModel(), (map) => UserModel.fromDatabase(map));
	static final UserRepository _instance = UserRepository._();
	static UserRepository get instance => _instance;

}