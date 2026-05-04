import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_food_popup_model.dart';
export 'add_food_popup_model.dart';

class AddFoodPopupWidget extends StatefulWidget {
  const AddFoodPopupWidget({
    super.key,
    required this.product,
    required this.mealType,
  });

  final ProductsRow? product;
  final String? mealType;

  @override
  State<AddFoodPopupWidget> createState() => _AddFoodPopupWidgetState();
}

class _AddFoodPopupWidgetState extends State<AddFoodPopupWidget> {
  late AddFoodPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFoodPopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -0.5),
      child: Container(
        width: 300.0,
        height: 380.0,
        child: custom_widgets.AddFoodWidget(
          width: 300.0,
          height: 380.0,
          foodName: widget.product!.name!,
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
          onAdd: (gramsProduct) async {
            await actions.logExistingProduct(
              currentUserUid,
              FFAppState().globalSelectedDate!,
              widget.mealType!,
              widget.product!.id,
              gramsProduct,
            );
            Navigator.pop(context);

            context.pushNamed(
              DiaryWidget.routeName,
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
