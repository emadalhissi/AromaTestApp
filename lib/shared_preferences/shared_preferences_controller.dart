import 'package:shared_preferences/shared_preferences.dart';

enum SPKeys {
  firstVisit,
  loggedIn,
  userName,
  email,
  password,
  fullName,
  dateOfBirth,
  language,
  gender,
  address,
  notifications,
  theme,
  token,
  sliderDownloaded,
  categoriesDownloaded,
}

class SharedPreferencesController {
  static final SharedPreferencesController _sharedPrefControllerObj =
      SharedPreferencesController._sharedPrefPrivateConstructor();

  SharedPreferencesController._sharedPrefPrivateConstructor();

  late SharedPreferences _sharedPrefLibObj;

  factory SharedPreferencesController() {
    return _sharedPrefControllerObj;
  }

  Future<void> initSharedPreferences() async {
    _sharedPrefLibObj = await SharedPreferences.getInstance();
  }

  Future<void> setLanguage({required String language}) async {
    await _sharedPrefLibObj.setString(SPKeys.language.toString(), language);
  }

  String get checkLanguage =>
      _sharedPrefLibObj.getString(SPKeys.language.toString()) ?? 'ar';

  Future<void> setToken({required String token}) async {
    await _sharedPrefLibObj.setString(
        SPKeys.token.toString(), 'Bearer ' + token);
  }

  String get getToken =>
      _sharedPrefLibObj.getString(SPKeys.token.toString()) ?? '';

  Future<void> setFirstVisit() async {
    await _sharedPrefLibObj.setBool(SPKeys.firstVisit.toString(), false);
  }

  bool get checkFirstVisit =>
      _sharedPrefLibObj.getBool(SPKeys.firstVisit.toString()) ?? true;

  Future<void> saveLoggedIn() async {
    await _sharedPrefLibObj.setBool(SPKeys.loggedIn.toString(), true);
  }

  bool get checkLoggedIn =>
      _sharedPrefLibObj.getBool(SPKeys.loggedIn.toString()) ?? false;

  Future<void> saveUserName({
    required String userName,
  }) async {
    await _sharedPrefLibObj.setString(SPKeys.userName.toString(), userName);
  }

  String get getUserName =>
      _sharedPrefLibObj.getString(SPKeys.userName.toString()) ?? '';

  Future<void> saveEmail({
    required String email,
  }) async {
    await _sharedPrefLibObj.setString(SPKeys.email.toString(), email);
  }

  String get getEmail =>
      _sharedPrefLibObj.getString(SPKeys.email.toString()) ?? '';

  Future<void> savePassword({
    required String password,
  }) async {
    await _sharedPrefLibObj.setString(SPKeys.password.toString(), password);
  }

  String get getPassword =>
      _sharedPrefLibObj.getString(SPKeys.password.toString()) ?? '';

  Future<void> saveFullName({
    required String fullName,
  }) async {
    await _sharedPrefLibObj.setString(SPKeys.fullName.toString(), fullName);
  }

  String get getFullName =>
      _sharedPrefLibObj.getString(SPKeys.fullName.toString()) ?? '';

  Future<void> saveDateOfBirth({
    required String dateOfBirth,
  }) async {
    await _sharedPrefLibObj.setString(
        SPKeys.dateOfBirth.toString(), dateOfBirth);
  }

  Future<void> setSliderDownloaded({required bool downloaded}) async {
    await _sharedPrefLibObj.setBool(
        SPKeys.sliderDownloaded.toString(), downloaded);
  }

  bool get getSliderDownloaded =>
      _sharedPrefLibObj.getBool(SPKeys.sliderDownloaded.toString()) ?? false;

  Future<void> setCategoriesDownloaded({required bool downloaded}) async {
    await _sharedPrefLibObj.setBool(
        SPKeys.categoriesDownloaded.toString(), downloaded);
  }

  bool get getCategoriesDownloaded =>
      _sharedPrefLibObj.getBool(SPKeys.categoriesDownloaded.toString()) ??
      false;

  Future<bool> logout() async {
    return await _sharedPrefLibObj.setBool(SPKeys.loggedIn.toString(), false);
  }
}
