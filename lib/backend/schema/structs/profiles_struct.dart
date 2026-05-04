// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfilesStruct extends BaseStruct {
  ProfilesStruct({
    String? id,
    String? username,
    String? gender,
    int? age,
    int? height,
    int? weight,
    int? goalWeight,
    String? activityLevel,
    int? targetCalories,
    int? targetCarbs,
    int? targetProtein,
    int? targetFats,
    String? email,
    String? mainGoal,
    String? calculationMode,
    bool? onboardingComplete,
  })  : _id = id,
        _username = username,
        _gender = gender,
        _age = age,
        _height = height,
        _weight = weight,
        _goalWeight = goalWeight,
        _activityLevel = activityLevel,
        _targetCalories = targetCalories,
        _targetCarbs = targetCarbs,
        _targetProtein = targetProtein,
        _targetFats = targetFats,
        _email = email,
        _mainGoal = mainGoal,
        _calculationMode = calculationMode,
        _onboardingComplete = onboardingComplete;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  set height(int? val) => _height = val;

  void incrementHeight(int amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  set weight(int? val) => _weight = val;

  void incrementWeight(int amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "goal_weight" field.
  int? _goalWeight;
  int get goalWeight => _goalWeight ?? 0;
  set goalWeight(int? val) => _goalWeight = val;

  void incrementGoalWeight(int amount) => goalWeight = goalWeight + amount;

  bool hasGoalWeight() => _goalWeight != null;

  // "activity_level" field.
  String? _activityLevel;
  String get activityLevel => _activityLevel ?? '';
  set activityLevel(String? val) => _activityLevel = val;

  bool hasActivityLevel() => _activityLevel != null;

  // "target_calories" field.
  int? _targetCalories;
  int get targetCalories => _targetCalories ?? 0;
  set targetCalories(int? val) => _targetCalories = val;

  void incrementTargetCalories(int amount) =>
      targetCalories = targetCalories + amount;

  bool hasTargetCalories() => _targetCalories != null;

  // "target_carbs" field.
  int? _targetCarbs;
  int get targetCarbs => _targetCarbs ?? 0;
  set targetCarbs(int? val) => _targetCarbs = val;

  void incrementTargetCarbs(int amount) => targetCarbs = targetCarbs + amount;

  bool hasTargetCarbs() => _targetCarbs != null;

  // "target_protein" field.
  int? _targetProtein;
  int get targetProtein => _targetProtein ?? 0;
  set targetProtein(int? val) => _targetProtein = val;

  void incrementTargetProtein(int amount) =>
      targetProtein = targetProtein + amount;

  bool hasTargetProtein() => _targetProtein != null;

  // "target_fats" field.
  int? _targetFats;
  int get targetFats => _targetFats ?? 0;
  set targetFats(int? val) => _targetFats = val;

  void incrementTargetFats(int amount) => targetFats = targetFats + amount;

  bool hasTargetFats() => _targetFats != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "mainGoal" field.
  String? _mainGoal;
  String get mainGoal => _mainGoal ?? '';
  set mainGoal(String? val) => _mainGoal = val;

  bool hasMainGoal() => _mainGoal != null;

  // "calculation_mode" field.
  String? _calculationMode;
  String get calculationMode => _calculationMode ?? '';
  set calculationMode(String? val) => _calculationMode = val;

  bool hasCalculationMode() => _calculationMode != null;

  // "onboarding_complete" field.
  bool? _onboardingComplete;
  bool get onboardingComplete => _onboardingComplete ?? false;
  set onboardingComplete(bool? val) => _onboardingComplete = val;

  bool hasOnboardingComplete() => _onboardingComplete != null;

  static ProfilesStruct fromMap(Map<String, dynamic> data) => ProfilesStruct(
        id: data['id'] as String?,
        username: data['username'] as String?,
        gender: data['gender'] as String?,
        age: castToType<int>(data['age']),
        height: castToType<int>(data['height']),
        weight: castToType<int>(data['weight']),
        goalWeight: castToType<int>(data['goal_weight']),
        activityLevel: data['activity_level'] as String?,
        targetCalories: castToType<int>(data['target_calories']),
        targetCarbs: castToType<int>(data['target_carbs']),
        targetProtein: castToType<int>(data['target_protein']),
        targetFats: castToType<int>(data['target_fats']),
        email: data['email'] as String?,
        mainGoal: data['mainGoal'] as String?,
        calculationMode: data['calculation_mode'] as String?,
        onboardingComplete: data['onboarding_complete'] as bool?,
      );

  static ProfilesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProfilesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'username': _username,
        'gender': _gender,
        'age': _age,
        'height': _height,
        'weight': _weight,
        'goal_weight': _goalWeight,
        'activity_level': _activityLevel,
        'target_calories': _targetCalories,
        'target_carbs': _targetCarbs,
        'target_protein': _targetProtein,
        'target_fats': _targetFats,
        'email': _email,
        'mainGoal': _mainGoal,
        'calculation_mode': _calculationMode,
        'onboarding_complete': _onboardingComplete,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'height': serializeParam(
          _height,
          ParamType.int,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.int,
        ),
        'goal_weight': serializeParam(
          _goalWeight,
          ParamType.int,
        ),
        'activity_level': serializeParam(
          _activityLevel,
          ParamType.String,
        ),
        'target_calories': serializeParam(
          _targetCalories,
          ParamType.int,
        ),
        'target_carbs': serializeParam(
          _targetCarbs,
          ParamType.int,
        ),
        'target_protein': serializeParam(
          _targetProtein,
          ParamType.int,
        ),
        'target_fats': serializeParam(
          _targetFats,
          ParamType.int,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'mainGoal': serializeParam(
          _mainGoal,
          ParamType.String,
        ),
        'calculation_mode': serializeParam(
          _calculationMode,
          ParamType.String,
        ),
        'onboarding_complete': serializeParam(
          _onboardingComplete,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ProfilesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfilesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.int,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.int,
          false,
        ),
        goalWeight: deserializeParam(
          data['goal_weight'],
          ParamType.int,
          false,
        ),
        activityLevel: deserializeParam(
          data['activity_level'],
          ParamType.String,
          false,
        ),
        targetCalories: deserializeParam(
          data['target_calories'],
          ParamType.int,
          false,
        ),
        targetCarbs: deserializeParam(
          data['target_carbs'],
          ParamType.int,
          false,
        ),
        targetProtein: deserializeParam(
          data['target_protein'],
          ParamType.int,
          false,
        ),
        targetFats: deserializeParam(
          data['target_fats'],
          ParamType.int,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        mainGoal: deserializeParam(
          data['mainGoal'],
          ParamType.String,
          false,
        ),
        calculationMode: deserializeParam(
          data['calculation_mode'],
          ParamType.String,
          false,
        ),
        onboardingComplete: deserializeParam(
          data['onboarding_complete'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ProfilesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfilesStruct &&
        id == other.id &&
        username == other.username &&
        gender == other.gender &&
        age == other.age &&
        height == other.height &&
        weight == other.weight &&
        goalWeight == other.goalWeight &&
        activityLevel == other.activityLevel &&
        targetCalories == other.targetCalories &&
        targetCarbs == other.targetCarbs &&
        targetProtein == other.targetProtein &&
        targetFats == other.targetFats &&
        email == other.email &&
        mainGoal == other.mainGoal &&
        calculationMode == other.calculationMode &&
        onboardingComplete == other.onboardingComplete;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        username,
        gender,
        age,
        height,
        weight,
        goalWeight,
        activityLevel,
        targetCalories,
        targetCarbs,
        targetProtein,
        targetFats,
        email,
        mainGoal,
        calculationMode,
        onboardingComplete
      ]);
}

ProfilesStruct createProfilesStruct({
  String? id,
  String? username,
  String? gender,
  int? age,
  int? height,
  int? weight,
  int? goalWeight,
  String? activityLevel,
  int? targetCalories,
  int? targetCarbs,
  int? targetProtein,
  int? targetFats,
  String? email,
  String? mainGoal,
  String? calculationMode,
  bool? onboardingComplete,
}) =>
    ProfilesStruct(
      id: id,
      username: username,
      gender: gender,
      age: age,
      height: height,
      weight: weight,
      goalWeight: goalWeight,
      activityLevel: activityLevel,
      targetCalories: targetCalories,
      targetCarbs: targetCarbs,
      targetProtein: targetProtein,
      targetFats: targetFats,
      email: email,
      mainGoal: mainGoal,
      calculationMode: calculationMode,
      onboardingComplete: onboardingComplete,
    );
