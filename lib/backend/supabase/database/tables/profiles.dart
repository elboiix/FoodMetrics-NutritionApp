import '../database.dart';

class ProfilesTable extends SupabaseTable<ProfilesRow> {
  @override
  String get tableName => 'profiles';

  @override
  ProfilesRow createRow(Map<String, dynamic> data) => ProfilesRow(data);
}

class ProfilesRow extends SupabaseDataRow {
  ProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get username => getField<String>('username')!;
  set username(String value) => setField<String>('username', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  int? get height => getField<int>('height');
  set height(int? value) => setField<int>('height', value);

  int? get weight => getField<int>('weight');
  set weight(int? value) => setField<int>('weight', value);

  int? get goalWeight => getField<int>('goal_weight');
  set goalWeight(int? value) => setField<int>('goal_weight', value);

  String? get activityLevel => getField<String>('activity_level');
  set activityLevel(String? value) => setField<String>('activity_level', value);

  int? get targetCalories => getField<int>('target_calories');
  set targetCalories(int? value) => setField<int>('target_calories', value);

  int? get targetCarbs => getField<int>('target_carbs');
  set targetCarbs(int? value) => setField<int>('target_carbs', value);

  int? get targetProtein => getField<int>('target_protein');
  set targetProtein(int? value) => setField<int>('target_protein', value);

  int? get targetFats => getField<int>('target_fats');
  set targetFats(int? value) => setField<int>('target_fats', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get maingoal => getField<String>('maingoal');
  set maingoal(String? value) => setField<String>('maingoal', value);

  String? get calculationMode => getField<String>('calculation_mode');
  set calculationMode(String? value) =>
      setField<String>('calculation_mode', value);

  bool? get onboardingComplete => getField<bool>('onboarding_complete');
  set onboardingComplete(bool? value) =>
      setField<bool>('onboarding_complete', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);
}
