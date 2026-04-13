import 'package:flutter_guiritter/model/_import.dart'
    show LoadingTagModel, StateModelWrapper;
import 'package:redux/redux.dart' show Store;

List<LoadingTagModel> selectLoadingTagList(
  Store<Map<String, dynamic>> store,
) =>
    StateModelWrapper(
      storeStateMap: store.state,
    ).loadingTagList;
