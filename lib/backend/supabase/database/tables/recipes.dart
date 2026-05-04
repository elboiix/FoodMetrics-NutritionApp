import '../database.dart';

class RecipesTable extends SupabaseTable<RecipesRow> {
  @override
  String get tableName => 'recipes';

  @override
  RecipesRow createRow(Map<String, dynamic> data) => RecipesRow(data);
}

class RecipesRow extends SupabaseDataRow {
  RecipesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RecipesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
