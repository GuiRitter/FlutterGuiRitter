import 'package:flutter_guiritter/common/_import.dart' show StateKey;
import 'package:flutter_guiritter/model/_import.dart' show LoadingTagModel;
import 'package:flutter_guiritter/model/state/_import.dart'
    show BaseStateModelWrapper;

mixin LoadingTagListMixin on BaseStateModelWrapper {
  List<LoadingTagModel> get loadingTagList => getLoadingTagList(
        storeStateMap: storeStateMap,
      );

  set loadingTagList(
    List<LoadingTagModel> loadingTagList,
  ) =>
      setLoadingTagList(
        storeStateMap: storeStateMap,
        loadingTagList: loadingTagList,
      );

  static List<LoadingTagModel> getLoadingTagList({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.loadingTagList] as List<LoadingTagModel>;

  static setLoadingTagList({
    required Map<String, dynamic> storeStateMap,
    required List<LoadingTagModel> loadingTagList,
  }) =>
      storeStateMap[StateKey.loadingTagList] = loadingTagList;
}
