import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'remove_product_popup_model.dart';
export 'remove_product_popup_model.dart';

class RemoveProductPopupWidget extends StatefulWidget {
  const RemoveProductPopupWidget({
    super.key,
    this.entryId,
  });

  final int? entryId;

  @override
  State<RemoveProductPopupWidget> createState() =>
      _RemoveProductPopupWidgetState();
}

class _RemoveProductPopupWidgetState extends State<RemoveProductPopupWidget> {
  late RemoveProductPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RemoveProductPopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 340.0,
        height: 330.0,
        child: custom_widgets.RemoveProductWidget(
          width: 340.0,
          height: 330.0,
          onCancel: () async {
            Navigator.pop(context);

            context.pushNamed(
              MyFoodWidget.routeName,
              queryParameters: {
                'mealType': serializeParam(
                  'None',
                  ParamType.String,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          },
          onRemove: () async {
            await actions.removeProduct(
              widget.entryId!,
              currentUserUid,
            );
            Navigator.pop(context);

            context.pushNamed(
              MyFoodWidget.routeName,
              queryParameters: {
                'mealType': serializeParam(
                  'None',
                  ParamType.String,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          },
        ),
      ),
    );
  }
}
