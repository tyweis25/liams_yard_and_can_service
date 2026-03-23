import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'releted_services_page_model.dart';
export 'releted_services_page_model.dart';

class ReletedServicesPageWidget extends StatefulWidget {
  const ReletedServicesPageWidget({
    super.key,
    required this.serviceRelatedList,
  });

  final List<ServicesModelStruct>? serviceRelatedList;

  static String routeName = 'ReletedServicesPage';
  static String routePath = '/reletedServicesPage';

  @override
  State<ReletedServicesPageWidget> createState() =>
      _ReletedServicesPageWidgetState();
}

class _ReletedServicesPageWidgetState extends State<ReletedServicesPageWidget> {
  late ReletedServicesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReletedServicesPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.mainAppbarModel,
                updateCallback: () => safeSetState(() {}),
                child: MainAppbarWidget(
                  title: 'Services',
                  isBack: false,
                  isEdit: false,
                  backAction: () async {},
                  editAction: () async {},
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final servicesCatList =
                                    widget.serviceRelatedList!.toList();

                                return Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children:
                                      List.generate(servicesCatList.length,
                                          (servicesCatListIndex) {
                                    final servicesCatListItem =
                                        servicesCatList[servicesCatListIndex];
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: wrapWithModel(
                                        model:
                                            _model.mainComponentModels.getModel(
                                          servicesCatListIndex.toString(),
                                          servicesCatListIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: MainComponentWidget(
                                          key: Key(
                                            'Key7pv_${servicesCatListIndex.toString()}',
                                          ),
                                          image: servicesCatListItem.image,
                                          name: servicesCatListItem.name,
                                          isLike: FFAppState()
                                              .favouriteList
                                              .where((e) =>
                                                  e.id ==
                                                  servicesCatListItem.id)
                                              .toList()
                                              .isNotEmpty,
                                          width: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                810.0) {
                                              return ((MediaQuery.sizeOf(
                                                              context)
                                                          .width -
                                                      48) *
                                                  1 /
                                                  2);
                                            } else if ((MediaQuery.sizeOf(
                                                            context)
                                                        .width >=
                                                    810.0) &&
                                                (MediaQuery.sizeOf(context)
                                                        .width <
                                                    1280.0)) {
                                              return ((MediaQuery.sizeOf(
                                                              context)
                                                          .width -
                                                      80) *
                                                  1 /
                                                  4);
                                            } else if ((MediaQuery.sizeOf(
                                                            context)
                                                        .width >=
                                                    1280.0) &&
                                                (MediaQuery.sizeOf(context)
                                                        .width <
                                                    2560.0)) {
                                              return ((MediaQuery.sizeOf(
                                                              context)
                                                          .width -
                                                      112) *
                                                  1 /
                                                  6);
                                            } else {
                                              return ((MediaQuery.sizeOf(
                                                              context)
                                                          .width -
                                                      144) *
                                                  1 /
                                                  8);
                                            }
                                          }(),
                                          review: servicesCatListItem.reviews,
                                          price: servicesCatListItem.price,
                                          duration:
                                              servicesCatListItem.duration,
                                          catName: servicesCatListItem
                                              .categoriesName,
                                          isMainTap: () async {
                                            context.pushNamed(
                                              ServicesDetailsWidget.routeName,
                                              queryParameters: {
                                                'serviceDetail': serializeParam(
                                                  servicesCatListItem,
                                                  ParamType.DataStruct,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          likeAction: () async {
                                            await action_blocks
                                                .addAndRemoveFavourite(
                                              context,
                                              isAvilable: FFAppState()
                                                  .favouriteList
                                                  .where((e) =>
                                                      e.id ==
                                                      servicesCatListItem.id)
                                                  .toList()
                                                  .isNotEmpty,
                                              product: servicesCatListItem,
                                            );
                                            safeSetState(() {});
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
        ),
      ),
    );
  }
}
