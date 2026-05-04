import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get barcode => getField<String>('barcode')!;
  set barcode(String value) => setField<String>('barcode', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  double? get caloriesPer100g => getField<double>('calories_per_100g');
  set caloriesPer100g(double? value) =>
      setField<double>('calories_per_100g', value);

  double? get carbsPer100g => getField<double>('carbs_per_100g');
  set carbsPer100g(double? value) => setField<double>('carbs_per_100g', value);

  double? get proteinPer100g => getField<double>('protein_per_100g');
  set proteinPer100g(double? value) =>
      setField<double>('protein_per_100g', value);

  double? get fatsPer100g => getField<double>('fats_per_100g');
  set fatsPer100g(double? value) => setField<double>('fats_per_100g', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  int? get grams => getField<int>('grams');
  set grams(int? value) => setField<int>('grams', value);
}
