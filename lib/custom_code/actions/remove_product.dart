// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> removeProduct(int productId, String uid) async {
  try {
    final supabase = Supabase.instance.client;

    await supabase
        .from('products')
        .delete()
        .eq('id', productId)
        .eq('created_by', uid);
  } catch (e) {
    print('Error al eliminar el producto del usuario: $e');
  }
}
