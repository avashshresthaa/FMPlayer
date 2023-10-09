import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;
  static const _publicInformation = "PublicInfo";
  static const _publicGuidance = "PublicGuidance";
  static const _token = 'TOKEN';
  static const _userType = 'USERTYPE';
  static const _firstName = 'FIRSTNAME';
  static const _uuID = 'UUID';
  static const _version = 'VERSION';
  static const _buildNumber = 'BUILDNUMBER';
  static const _isSkip = 'SKIP';
  static const _isBio = 'BIOMERTICS';
  static const _isPanic = 'PANIC';
  static const _lastName = 'LASTNAME';
  static const _email = 'EMAIL';
  static const _phone = 'PHONE';
  static const _panicID = 'PANICID';
  static const _username = 'USERNAME';
  static const _language = 'Language';
  static const _password = 'PASSWORD';
  static const _isDark = 'ISDARK';
  static const _isRemember = 'RememberMe';
  static const _province = 'Province';
  static const _district = 'District';
  static const _palika = 'Palika';
  static const _fmurl = 'FMURL';
  static const _userID = 'USERID';
  static const _policeToken = 'POLICETOKEN';
  static const _ward = 'WARD';
  static const _houseNo = 'HOUSENO';
  static const _street = 'STREET';
  static const _photo = 'PHOTO';
  static const _gpsFrequency = 'GPSFREQUENCY';
  static const _date = 'DATE';
  static const _backgroundService = '_background service';
  static const _pattrolling = 'PATTROLLING';
  static const _ispattrolling = 'ISPATT';
  static const _patData = 'ISPATDATA';
  static const _policeCode = 'POLICECODE';
  static const _setPMIS = 'PMISSET';
  static const _geoUserID = 'GEOUSERID';

  static Future setPublicInformation(bool publicInfo) async {
    await _preferences?.setBool(_publicInformation, publicInfo);
  }

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async {
    await _preferences?.setString(_token, token);
  }

  static Future setGeoUserID(String geoID) async {
    await _preferences?.setString(_geoUserID, geoID);
  }

  static Future setPoliceToken(String policeToken) async {
    await _preferences?.setString(_policeToken, policeToken);
  }

  static Future setFirstName(String name) async {
    await _preferences?.setString(_firstName, name);
  }

  static Future setLastName(String lastname) async {
    await _preferences?.setString(_lastName, lastname);
  }

  static Future setLanguage(bool language) async {
    await _preferences?.setBool(_language, language);
  }

  static Future setBackgroundService(bool backgroundService) async {
    await _preferences?.setBool(_backgroundService, backgroundService);
  }

  static Future setEmail(String email) async {
    await _preferences?.setString(_email, email);
  }

  static Future setUserType(String userType) async {
    await _preferences?.setString(_userType, userType);
  }

  static Future setuuid(String uuid) async {
    await _preferences?.setString(_uuID, uuid);
  }

  static Future gpsFrequency(int frequency) async {
    await _preferences?.setInt(_gpsFrequency, frequency);
  }

  static Future setVersion(String version) async {
    await _preferences?.setString(_version, version);
  }

  static Future setBuildNumber(String buildNumber) async {
    await _preferences?.setString(_buildNumber, buildNumber);
  }

  static Future setPhoneNumber(String phoneNumber) async {
    await _preferences?.setString(_phone, phoneNumber);
  }

  static Future setSkip(bool isSkip) async {
    await _preferences?.setBool(_isSkip, isSkip);
  }

  static Future setDark(bool isDark) async {
    await _preferences?.setBool(_isDark, isDark);
  }

  static Future setBiometrics(bool isBio) async {
    await _preferences?.setBool(_isBio, isBio);
  }

  static Future setPanic(bool isPanic) async {
    await _preferences?.setBool(_isPanic, isPanic);
  }

  static Future setRememberMe(bool isRemember) async {
    await _preferences?.setBool(_isRemember, isRemember);
  }

  static Future setPublicGuidance(bool publicGuidance) async {
    await _preferences?.setBool(_publicGuidance, publicGuidance);
  }

  static Future setPanicID(String panicID) async {
    await _preferences?.setString(_panicID, panicID);
  }

  static Future setUsernamePassword(String username, String password) async {
    await _preferences?.setString(_username, username);
    await _preferences?.setString(_password, password);
  }

  static Future setFMURL(String setPIndex) async {
    await _preferences?.setString(_fmurl, setPIndex);
  }

  static Future setPhotoUrl(String photo) async {
    await _preferences?.setString(_photo, photo);
  }

  static Future setDate(String date) async {
    await _preferences?.setString(_date, date);
  }

  static Future setPatrolling(bool isPattroling) async {
    await _preferences?.setBool(_ispattrolling, isPattroling);
  }

  static Future setUpdatePmis(bool isPmis) async {
    await _preferences?.setBool(_setPMIS, isPmis);
  }

  static Future setAddress(
      String province, String district, String palika) async {
    await _preferences?.setString(_province, province);
    await _preferences?.setString(_district, district);
    await _preferences?.setString(_palika, palika);
  }

  static Future setMoreAddress(
      String ward, String houseNo, String street) async {
    await _preferences?.setString(_ward, ward);
    await _preferences?.setString(_houseNo, houseNo);
    await _preferences?.setString(_street, street);
  }

  static userLoggedIn() {
    return _preferences?.containsKey(_token);
  }

  static Future setUserID(String userID) async {
    await _preferences?.setString(_userID, userID);
  }

  static Future setPatrollingID(String pattrolingID) async {
    await _preferences?.setString(_pattrolling, pattrolingID);
  }

  static Future setPatrollingData(String pattrolingData) async {
    await _preferences?.setString(_patData, pattrolingData);
  }

  static Future setPoliceCode(String policeCode) async {
    await _preferences?.setString(_policeCode, policeCode);
  }

  static bool? getPublicInformation() =>
      _preferences?.getBool(_publicInformation);
  static String? getToken() => _preferences?.getString(_token);
  static String? getGeoUserID() => _preferences?.getString(_geoUserID);

  static String? getPattrollingID() => _preferences?.getString(_pattrolling);

  static String? getPoliceToken() => _preferences?.getString(_policeToken);
  static String? getFirstName() => _preferences?.getString(_firstName);
  static String? getLastName() => _preferences?.getString(_lastName);
  static String? getEmail() => _preferences?.getString(_email);
  static String? getPhone() => _preferences?.getString(_phone);
  static String? getUserType() => _preferences?.getString(_userType);
  static String? getUUID() => _preferences?.getString(_uuID);
  static int? getFrequency() => _preferences?.getInt(_gpsFrequency);
  static String? getPanicID() => _preferences?.getString(_panicID);
  static String? getVersion() => _preferences?.getString(_version);
  static String? getBuildNumber() => _preferences?.getString(_buildNumber);
  static bool? getSkip() => _preferences?.getBool(_isSkip);
  static bool? getDark() => _preferences?.getBool(_isDark);
  static bool? getBiometrics() => _preferences?.getBool(_isBio);
  static bool? getPublicGuidance() => _preferences?.getBool(_publicGuidance);
  static bool? getBackgroundService() =>
      _preferences?.getBool(_backgroundService);
  static bool? getRememberMe() => _preferences?.getBool(_isRemember);
  static bool? getPanic() => _preferences?.getBool(_isPanic);
  static bool? getisPattroling() => _preferences?.getBool(_ispattrolling);
  static String? getPassword() => _preferences?.getString(_password);
  static String? getUsername() => _preferences?.getString(_username);
  static bool? getLanguage() => _preferences?.getBool(_language);
  static String? getDistrict() => _preferences?.getString(_district);
  static String? getProvince() => _preferences?.getString(_province);
  static String? getPalika() => _preferences?.getString(_palika);
  static String? getUserID() => _preferences?.getString(_userID);
  static String? getHouseNo() => _preferences?.getString(_houseNo);
  static String? getStreet() => _preferences?.getString(_street);
  static String? getWard() => _preferences?.getString(_ward);
  static String? getPhotoLocation() => _preferences?.getString(_photo);
  static String? getDate() => _preferences?.getString(_date);
  static String? getPattrolingData() => _preferences?.getString(_patData);

  static String? getFMURL() => _preferences?.getString(_fmurl);
  static String? getPoliceCode() => _preferences?.getString(_policeCode);
  static bool? getsetPMIS() => _preferences?.getBool(_setPMIS);

  static Future logout() async {
    await _preferences?.remove(_token);
    await _preferences?.remove(_policeToken);
    await _preferences?.remove(_firstName);
    await _preferences?.remove(_lastName);
    await _preferences?.remove(_email);
    await _preferences?.remove(_userType);
    await _preferences?.remove(_photo);
    await _preferences?.remove(_isSkip);
    await _preferences?.remove(_date);
    await _preferences?.remove(_setPMIS);
    await _preferences?.remove(_userID);
    await _preferences?.remove(_isSkip);
  }

  static Future removeFM() async {
    await _preferences?.remove(_fmurl);
  }

  static Future removeFrequency() async {
    await _preferences?.remove(_gpsFrequency);
  }

  static Future removeBG() async {
    await _preferences?.remove(_patData);
    await _preferences?.remove(_pattrolling);
    await _preferences?.remove(_ispattrolling);
    await _preferences?.remove(_isPanic);
    print("clear");
  }

  static Future removeChangePass() async {
    await _preferences?.remove(_isBio);
    await _preferences?.remove(_isRemember);
  }
}
