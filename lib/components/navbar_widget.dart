import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

/// hazme un navbar flotante con el apartado de home, diary, profile y camera
class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    this.pageLocationParameter,
  });

  final String? pageLocationParameter;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget>
    with TickerProviderStateMixin {
  late NavbarModel _model;

  var hasIconTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: Color(0x8B000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          DashboardWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Icon(
                        Icons.home,
                        color: widget.pageLocationParameter == 'Dashboard'
                            ? Color(0xFF775FE7)
                            : Color(0xFF57636C),
                        size: 24.0,
                      ),
                    ).animateOnActionTrigger(
                        animationsMap['iconOnActionTriggerAnimation']!,
                        hasBeenTriggered: hasIconTriggered),
                  ].divide(SizedBox(height: 4.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
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
                      child: Icon(
                        Icons.book_rounded,
                        color: widget.pageLocationParameter == 'Diary'
                            ? Color(0xFF775FE7)
                            : Color(0xFF57636C),
                        size: 24.0,
                      ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var _shouldSetState = false;

                        context.pushNamed(
                          MyFoodWidget.routeName,
                          queryParameters: {
                            'mealType': serializeParam(
                              'None',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );

                        _model.finalCode = await actions.barcodeScan();
                        _shouldSetState = true;
                        if (_model.finalCode != null &&
                            _model.finalCode != '') {
                          _model.aPIresult = await GetFoodByBarcodeCall.call(
                            barcode: _model.finalCode,
                          );

                          _shouldSetState = true;
                          if ((_model.aPIresult?.succeeded ?? true)) {
                            await ProductsTable().insert({
                              'barcode': _model.finalCode,
                              'name': getJsonField(
                                (_model.aPIresult?.jsonBody ?? ''),
                                r'''$.product.product_name''',
                              ).toString(),
                              'calories_per_100g':
                                  functions.convertKjToKcal(getJsonField(
                                (_model.aPIresult?.jsonBody ?? ''),
                                r'''$.product.nutriments.energy_100g''',
                              )),
                              'carbs_per_100g': getJsonField(
                                (_model.aPIresult?.jsonBody ?? ''),
                                r'''$.product.nutriments.carbohydrates_100g''',
                              ),
                              'protein_per_100g': getJsonField(
                                (_model.aPIresult?.jsonBody ?? ''),
                                r'''$.product.nutriments.proteins_100g''',
                              ),
                              'fats_per_100g': getJsonField(
                                (_model.aPIresult?.jsonBody ?? ''),
                                r'''$.product.nutriments.fat_100g''',
                              ),
                              'created_by': currentUserUid,
                              'grams': 100,
                            });

                            context.pushNamed(
                              MyFoodWidget.routeName,
                              queryParameters: {
                                'mealType': serializeParam(
                                  'None',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Product not found in the Open Food Facts database.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF333333),
                              ),
                            );
                          }

                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'The barcode wasn\'t scanned correctly. Please try again (turn on the flashlight to improve the scan).',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Color(0xFF333333),
                            ),
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: widget.pageLocationParameter == 'Camera'
                            ? Color(0xFF775FE7)
                            : Color(0xFF57636C),
                        size: 24.0,
                      ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
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
                      child: Icon(
                        Icons.food_bank,
                        color: widget.pageLocationParameter == 'MyFood'
                            ? Color(0xFF775FE7)
                            : Color(0xFF57636C),
                        size: 27.0,
                      ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          ProfileWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Icon(
                        Icons.person_rounded,
                        color: widget.pageLocationParameter == 'Profile'
                            ? Color(0xFF775FE7)
                            : Color(0xFF57636C),
                        size: 24.0,
                      ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ].divide(SizedBox(width: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
