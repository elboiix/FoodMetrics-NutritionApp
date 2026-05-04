import '../database.dart';

class DailyLogsTable extends SupabaseTable<DailyLogsRow> {
  @override
  String get tableName => 'daily_logs';

  @override
  DailyLogsRow createRow(Map<String, dynamic> data) => DailyLogsRow(data);
}

class DailyLogsRow extends SupabaseDataRow {
  DailyLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DailyLogsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime? get logDate => getField<DateTime>('log_date');
  set logDate(DateTime? value) => setField<DateTime>('log_date', value);
}
