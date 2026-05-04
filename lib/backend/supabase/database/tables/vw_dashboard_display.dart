import '../database.dart';

class VwDashboardDisplayTable extends SupabaseTable<VwDashboardDisplayRow> {
  @override
  String get tableName => 'vw_dashboard_display';

  @override
  VwDashboardDisplayRow createRow(Map<String, dynamic> data) =>
      VwDashboardDisplayRow(data);
}

class VwDashboardDisplayRow extends SupabaseDataRow {
  VwDashboardDisplayRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwDashboardDisplayTable();

  int? get logId => getField<int>('log_id');
  set logId(int? value) => setField<int>('log_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get logDate => getField<DateTime>('log_date');
  set logDate(DateTime? value) => setField<DateTime>('log_date', value);

  double? get caloriesConsumed => getField<double>('calories_consumed');
  set caloriesConsumed(double? value) =>
      setField<double>('calories_consumed', value);

  double? get caloriesRemaining => getField<double>('calories_remaining');
  set caloriesRemaining(double? value) =>
      setField<double>('calories_remaining', value);

  double? get caloriesArc => getField<double>('calories_arc');
  set caloriesArc(double? value) => setField<double>('calories_arc', value);

  int? get caloriesPct => getField<int>('calories_pct');
  set caloriesPct(int? value) => setField<int>('calories_pct', value);

  double? get carbsConsumed => getField<double>('carbs_consumed');
  set carbsConsumed(double? value) => setField<double>('carbs_consumed', value);

  double? get carbsArc => getField<double>('carbs_arc');
  set carbsArc(double? value) => setField<double>('carbs_arc', value);

  int? get carbsPct => getField<int>('carbs_pct');
  set carbsPct(int? value) => setField<int>('carbs_pct', value);

  double? get proteinConsumed => getField<double>('protein_consumed');
  set proteinConsumed(double? value) =>
      setField<double>('protein_consumed', value);

  double? get proteinArc => getField<double>('protein_arc');
  set proteinArc(double? value) => setField<double>('protein_arc', value);

  int? get proteinPct => getField<int>('protein_pct');
  set proteinPct(int? value) => setField<int>('protein_pct', value);

  double? get fatsConsumed => getField<double>('fats_consumed');
  set fatsConsumed(double? value) => setField<double>('fats_consumed', value);

  double? get fatsArc => getField<double>('fats_arc');
  set fatsArc(double? value) => setField<double>('fats_arc', value);

  int? get fatsPct => getField<int>('fats_pct');
  set fatsPct(int? value) => setField<int>('fats_pct', value);

  int? get breakfastFoods => getField<int>('breakfast_foods');
  set breakfastFoods(int? value) => setField<int>('breakfast_foods', value);

  double? get breakfastCalories => getField<double>('breakfast_calories');
  set breakfastCalories(double? value) =>
      setField<double>('breakfast_calories', value);

  int? get lunchFoods => getField<int>('lunch_foods');
  set lunchFoods(int? value) => setField<int>('lunch_foods', value);

  double? get lunchCalories => getField<double>('lunch_calories');
  set lunchCalories(double? value) => setField<double>('lunch_calories', value);

  int? get dinnerFoods => getField<int>('dinner_foods');
  set dinnerFoods(int? value) => setField<int>('dinner_foods', value);

  double? get dinnerCalories => getField<double>('dinner_calories');
  set dinnerCalories(double? value) =>
      setField<double>('dinner_calories', value);

  int? get snackFoods => getField<int>('snack_foods');
  set snackFoods(int? value) => setField<int>('snack_foods', value);

  double? get snackCalories => getField<double>('snack_calories');
  set snackCalories(double? value) => setField<double>('snack_calories', value);

  int? get supperFoods => getField<int>('supper_foods');
  set supperFoods(int? value) => setField<int>('supper_foods', value);

  double? get supperCalories => getField<double>('supper_calories');
  set supperCalories(double? value) =>
      setField<double>('supper_calories', value);
}
