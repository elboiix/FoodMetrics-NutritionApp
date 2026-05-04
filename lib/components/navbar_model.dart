import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'navbar_widget.dart' show NavbarWidget;
import 'package:flutter/material.dart';

class NavbarModel extends FlutterFlowModel<NavbarWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - barcodeScan] action in Icon widget.
  String? finalCode;
  // Stores action output result for [Backend Call - API (GetFoodByBarcode)] action in Icon widget.
  ApiCallResponse? aPIresult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
