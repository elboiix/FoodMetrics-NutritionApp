import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'remove_product_diary_popup_model.dart';
export 'remove_product_diary_popup_model.dart';

class RemoveProductDiaryPopupWidget extends StatefulWidget {
  const RemoveProductDiaryPopupWidget({
    super.key,
    this.entryId,
  });

  final int? entryId;

  @override
  State<RemoveProductDiaryPopupWidget> createState() =>
      _RemoveProductDiaryPopupWidgetState();
}

class _RemoveProductDiaryPopupWidgetState
    extends State<RemoveProductDiaryPopupWidget> {
  late RemoveProductDiaryPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RemoveProductDiaryPopupModel());

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
        child: custom_widgets.RemoveDiaryWidget(
          width: 340.0,
          height: 330.0,
          onCancel: () async {
            Navigator.pop(context);
          },
          onRemove: () async {
            await actions.removeProductDiary(
              widget.entryId!,
            );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
