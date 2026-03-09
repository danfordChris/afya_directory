import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';
import 'package:afya_bee/models/user_model.dart';

class DatabaseManager extends BaseDatabaseManager {
	DatabaseManager._(): super("afya_bee.db", 1, _tables);
	static final DatabaseManager _instance = DatabaseManager._();
	static DatabaseManager get instance => _instance;

	static List<BaseDatabaseModel> get _tables {
		return [
			UserModel()
		];
	}
}