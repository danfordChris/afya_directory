import 'package:afya_bee/models/user_model.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

/// * ---------- Auto Generated Code ---------- * ///

class UserModelGen extends BaseDatabaseModel {
	int? _id;
	String? _avatar;
	String? _fullName;
	String? _phoneNumber;
	String? _dateOfBirth;
	String? _occupation;
	String? _street;
	int? _maritalStatus;
	int? _gender;
	String? _email;
	String? _department;
	String? _username;
	String? _password;
	int? _userRole;
	bool? _isActive;
	String? _lastLogin;
	
	UserModelGen(this._id, this._avatar, this._fullName, this._phoneNumber, this._dateOfBirth, this._occupation, this._street, this._maritalStatus, this._gender, this._email, this._department, this._username, this._password, this._userRole, this._isActive, this._lastLogin, );

	int? get id => _id;
	String? get avatar => _avatar;
	String? get fullName => _fullName;
	String? get phoneNumber => _phoneNumber;
	String? get dateOfBirth => _dateOfBirth;
	String? get occupation => _occupation;
	String? get street => _street;
	int? get maritalStatus => _maritalStatus;
	int? get gender => _gender;
	String? get email => _email;
	String? get department => _department;
	String? get username => _username;
	String? get password => _password;
	int? get userRole => _userRole;
	bool? get isActive => _isActive;
	String? get lastLogin => _lastLogin;
	
	set id(int? id) => this._id = id;
	set avatar(String? avatar) => this._avatar = avatar;
	set fullName(String? fullName) => this._fullName = fullName;
	set phoneNumber(String? phoneNumber) => this._phoneNumber = phoneNumber;
	set dateOfBirth(String? dateOfBirth) => this._dateOfBirth = dateOfBirth;
	set occupation(String? occupation) => this._occupation = occupation;
	set street(String? street) => this._street = street;
	set maritalStatus(int? maritalStatus) => this._maritalStatus = maritalStatus;
	set gender(int? gender) => this._gender = gender;
	set email(String? email) => this._email = email;
	set department(String? department) => this._department = department;
	set username(String? username) => this._username = username;
	set password(String? password) => this._password = password;
	set userRole(int? userRole) => this._userRole = userRole;
	set isActive(bool? isActive) => this._isActive = isActive;
	set lastLogin(String? lastLogin) => this._lastLogin = lastLogin;
	
	static UserModel fromJson(Map<String, dynamic> map) {
		return UserModel(id: BaseModel.castToInt(map['id']), avatar: map['avatar'], fullName: map['fullName'], phoneNumber: map['phoneNumber'], dateOfBirth: map['dateOfBirth'], occupation: map['occupation'], street: map['street'], maritalStatus: BaseModel.castToInt(map['maritalStatus']), gender: BaseModel.castToInt(map['gender']), email: map['email'], department: map['department'], username: map['username'], password: map['password'], userRole: BaseModel.castToInt(map['userRole']), isActive: BaseModel.castToBool(map['isActive']), lastLogin: map['lastLogin'], );
	}

	static UserModel fromDatabase(Map<String, dynamic> map) {
		return UserModel(id: BaseModel.castToInt(map['id']), avatar: map['avatar'], fullName: map['full_name'], phoneNumber: map['phone_number'], dateOfBirth: map['date_of_birth'], occupation: map['occupation'], street: map['street'], maritalStatus: BaseModel.castToInt(map['marital_status']), gender: BaseModel.castToInt(map['gender']), email: map['email'], department: map['department'], username: map['username'], password: map['password'], userRole: BaseModel.castToInt(map['user_role']), isActive: BaseModel.castToBool(map['is_active']), lastLogin: map['last_login'], );
	}

	@override
	String get tableName => "user";

	@override
	Map<String, dynamic> get toMap {
		return { "id": id, "avatar": avatar, "full_name": fullName, "phone_number": phoneNumber, "date_of_birth": dateOfBirth, "occupation": occupation, "street": street, "marital_status": maritalStatus, "gender": gender, "email": email, "department": department, "username": username, "password": password, "user_role": userRole, "is_active": isActive == null ? null : (isActive != null && isActive!) ? 1 : 0, "last_login": lastLogin, };
	}

	Map<String, dynamic> get toJson {
		return { "id": id, "avatar": avatar, "fullName": fullName, "phoneNumber": phoneNumber, "dateOfBirth": dateOfBirth, "occupation": occupation, "street": street, "maritalStatus": maritalStatus, "gender": gender, "email": email, "department": department, "username": username, "password": password, "userRole": userRole, "isActive": isActive, "lastLogin": lastLogin, };
	}

	@override
	Map<String, String> get toSchema {
		return { "id": "INTEGER PRIMARY KEY", "avatar": "TEXT", "full_name": "TEXT", "phone_number": "TEXT", "date_of_birth": "TEXT", "occupation": "TEXT", "street": "TEXT", "marital_status": "INTEGER", "gender": "INTEGER", "email": "TEXT", "department": "TEXT", "username": "TEXT", "password": "TEXT", "user_role": "INTEGER", "is_active": "INTEGER", "last_login": "TEXT", };
	}

	UserModel merge(UserModel model) {
		_id = model.id ?? this._id;
		_avatar = model.avatar ?? this._avatar;
		_fullName = model.fullName ?? this._fullName;
		_phoneNumber = model.phoneNumber ?? this._phoneNumber;
		_dateOfBirth = model.dateOfBirth ?? this._dateOfBirth;
		_occupation = model.occupation ?? this._occupation;
		_street = model.street ?? this._street;
		_maritalStatus = model.maritalStatus ?? this._maritalStatus;
		_gender = model.gender ?? this._gender;
		_email = model.email ?? this._email;
		_department = model.department ?? this._department;
		_username = model.username ?? this._username;
		_password = model.password ?? this._password;
		_userRole = model.userRole ?? this._userRole;
		_isActive = model.isActive ?? this._isActive;
		_lastLogin = model.lastLogin ?? this._lastLogin;
		return UserModel(
			id: model.id ?? _id,
			avatar: model.avatar ?? _avatar,
			fullName: model.fullName ?? _fullName,
			phoneNumber: model.phoneNumber ?? _phoneNumber,
			dateOfBirth: model.dateOfBirth ?? _dateOfBirth,
			occupation: model.occupation ?? _occupation,
			street: model.street ?? _street,
			maritalStatus: model.maritalStatus ?? _maritalStatus,
			gender: model.gender ?? _gender,
			email: model.email ?? _email,
			department: model.department ?? _department,
			username: model.username ?? _username,
			password: model.password ?? _password,
			userRole: model.userRole ?? _userRole,
			isActive: model.isActive ?? _isActive,
			lastLogin: model.lastLogin ?? _lastLogin
		);
	}

	UserModel mergeWith({int? id, String? avatar, String? fullName, String? phoneNumber, String? dateOfBirth, String? occupation, String? street, int? maritalStatus, int? gender, String? email, String? department, String? username, String? password, int? userRole, bool? isActive, String? lastLogin}) {
		_id = id ?? this._id;
		_avatar = avatar ?? this._avatar;
		_fullName = fullName ?? this._fullName;
		_phoneNumber = phoneNumber ?? this._phoneNumber;
		_dateOfBirth = dateOfBirth ?? this._dateOfBirth;
		_occupation = occupation ?? this._occupation;
		_street = street ?? this._street;
		_maritalStatus = maritalStatus ?? this._maritalStatus;
		_gender = gender ?? this._gender;
		_email = email ?? this._email;
		_department = department ?? this._department;
		_username = username ?? this._username;
		_password = password ?? this._password;
		_userRole = userRole ?? this._userRole;
		_isActive = isActive ?? this._isActive;
		_lastLogin = lastLogin ?? this._lastLogin;
		return UserModel(
			id: id ?? _id,
			avatar: avatar ?? _avatar,
			fullName: fullName ?? _fullName,
			phoneNumber: phoneNumber ?? _phoneNumber,
			dateOfBirth: dateOfBirth ?? _dateOfBirth,
			occupation: occupation ?? _occupation,
			street: street ?? _street,
			maritalStatus: maritalStatus ?? _maritalStatus,
			gender: gender ?? _gender,
			email: email ?? _email,
			department: department ?? _department,
			username: username ?? _username,
			password: password ?? _password,
			userRole: userRole ?? _userRole,
			isActive: isActive ?? _isActive,
			lastLogin: lastLogin ?? _lastLogin
		);
	}

	UserModel copy(UserModel model) {
		return UserModel(
			id: model.id ?? _id,
			avatar: model.avatar ?? _avatar,
			fullName: model.fullName ?? _fullName,
			phoneNumber: model.phoneNumber ?? _phoneNumber,
			dateOfBirth: model.dateOfBirth ?? _dateOfBirth,
			occupation: model.occupation ?? _occupation,
			street: model.street ?? _street,
			maritalStatus: model.maritalStatus ?? _maritalStatus,
			gender: model.gender ?? _gender,
			email: model.email ?? _email,
			department: model.department ?? _department,
			username: model.username ?? _username,
			password: model.password ?? _password,
			userRole: model.userRole ?? _userRole,
			isActive: model.isActive ?? _isActive,
			lastLogin: model.lastLogin ?? _lastLogin
		);
	}

	UserModel copyWith({int? id, String? avatar, String? fullName, String? phoneNumber, String? dateOfBirth, String? occupation, String? street, int? maritalStatus, int? gender, String? email, String? department, String? username, String? password, int? userRole, bool? isActive, String? lastLogin}) {
		return UserModel(
			id: id ?? _id,
			avatar: avatar ?? _avatar,
			fullName: fullName ?? _fullName,
			phoneNumber: phoneNumber ?? _phoneNumber,
			dateOfBirth: dateOfBirth ?? _dateOfBirth,
			occupation: occupation ?? _occupation,
			street: street ?? _street,
			maritalStatus: maritalStatus ?? _maritalStatus,
			gender: gender ?? _gender,
			email: email ?? _email,
			department: department ?? _department,
			username: username ?? _username,
			password: password ?? _password,
			userRole: userRole ?? _userRole,
			isActive: isActive ?? _isActive,
			lastLogin: lastLogin ?? _lastLogin
		);
	}

	@override
	Map<String, Map<String, String>>? get dataRelation => null;

}