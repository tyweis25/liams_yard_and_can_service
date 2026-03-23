import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/empty_components/no_favourite_component/no_favourite_component_widget.dart';
import '/index.dart';
import 'favorites_page_widget.dart' show FavoritesPageWidget;
import 'package:flutter/material.dart';

class FavoritesPageModel extends FlutterFlowModel<FavoritesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainAppbar component.
  late MainAppbarModel mainAppbarModel;
  // Models for MainComponent dynamic component.
  late FlutterFlowDynamicModels<MainComponentModel> mainComponentModels;
  // Model for NoFavouriteComponent component.
  late NoFavouriteComponentModel noFavouriteComponentModel;

  @override
  void initState(BuildContext context) {
    mainAppbarModel = createModel(context, () => MainAppbarModel());
    mainComponentModels = FlutterFlowDynamicModels(() => MainComponentModel());
    noFavouriteComponentModel =
        createModel(context, () => NoFavouriteComponentModel());
  }

  @override
  void dispose() {
    mainAppbarModel.dispose();
    mainComponentModels.dispose();
    noFavouriteComponentModel.dispose();
  }
}
