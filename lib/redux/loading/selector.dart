import 'package:flutter_guiritter/model/_import.dart'
    show LoadingTagModel, StateModelWrapperOld;
import 'package:redux/redux.dart' show Store;

List<LoadingTagModel> selectLoadingTagList(
  Store<Map<String, dynamic>> store,
) =>
    StateModelWrapperOld(
      storeStateMap: store.state,
    ).loadingTagList;
