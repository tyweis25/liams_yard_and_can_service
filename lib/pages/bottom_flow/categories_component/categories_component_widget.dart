import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/category_component/category_component_widget.dart';
import '/pages/components/center_appbar/center_appbar_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'categories_component_model.dart';
export 'categories_component_model.dart';

class CategoriesComponentWidget extends StatefulWidget {
  const CategoriesComponentWidget({super.key});

  @override
  State<CategoriesComponentWidget> createState() =>
      _CategoriesComponentWidgetState();
}

class _CategoriesComponentWidgetState extends State<CategoriesComponentWidget> {
  late CategoriesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesComponentModel());

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.centerAppbarModel,
            updateCallback: () => safeSetState(() {}),
            child: CenterAppbarWidget(
              title: 'Categories',
            ),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (FFAppState().connected) {
                  return ListView(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      8.0,
                      0,
                      8.0,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final allCategoriesList =
                                FFAppState().categoriesList.toList();

                            return Wrap(
                              spacing: 0.0,
                              runSpacing: 0.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(allCategoriesList.length,
                                  (allCategoriesListIndex) {
                                final allCategoriesListItem =
                                    allCategoriesList[allCategoriesListIndex];
                                return Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: wrapWithModel(
                                    model:
                                        _model.categoryComponentModels.getModel(
                                      allCategoriesListIndex.toString(),
                                      allCategoriesListIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: CategoryComponentWidget(
                                      key: Key(
                                        'Keye2w_${allCategoriesListIndex.toString()}',
                                      ),
                                      image: allCategoriesListItem.image,
                                      name: allCategoriesListItem.name,
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            810.0) {
                                          return ((MediaQuery.sizeOf(context)
                                                      .width -
                                                  64) *
                                              1 /
                                              3);
                                        } else if ((MediaQuery.sizeOf(context)
                                                    .width >=
                                                810.0) &&
                                            (MediaQuery.sizeOf(context).width <
                                                1280.0)) {
                                          return ((MediaQuery.sizeOf(context)
                                                      .width -
                                                  112) *
                                              1 /
                                              6);
                                        } else if ((MediaQuery.sizeOf(context)
                                                    .width >=
                                                1280.0) &&
                                            (MediaQuery.sizeOf(context).width <
                                                2560.0)) {
                                          return ((MediaQuery.sizeOf(context)
                                                      .width -
                                                  160) *
                                              1 /
                                              9);
                                        } else {
                                          return ((MediaQuery.sizeOf(context)
                                                      .width -
                                                  208) *
                                              1 /
                                              12);
                                        }
                                      }(),
                                      onTap: () async {
                                        context.pushNamed(
                                          CatRelatedPageWidget.routeName,
                                          queryParameters: {
                                            'title': serializeParam(
                                              allCategoriesListItem.name,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Lottie.asset(
                      'assets/jsons/No_Wifi.json',
                      width: 120.0,
                      height: 120.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
