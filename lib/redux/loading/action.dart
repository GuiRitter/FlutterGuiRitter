import 'package:flutter_guiritter/model/_import.dart'
    show LoadingTagModel, StateModelWrapper;
import 'package:redux/redux.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart' show ThunkAction;

ThunkAction<Map<String, dynamic>> add({
  required List<LoadingTagModel> list,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async =>
        store.dispatch(
          AddLoadingAction(
            list: list,
          ),
        );

ThunkAction<Map<String, dynamic>> cancel({
  required String id,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async {
      final state = StateModelWrapper(
        storeStateMap: store.state,
      );

      final loadingTag = state.loadingTagList.firstWhere(
        LoadingTagModel.idEquals(
          id,
        ),
      );

      loadingTag.cancelToken.cancel();
    };

ThunkAction<Map<String, dynamic>> remove({
  required List<String> idList,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async =>
        store.dispatch(
          RemoveLoadingAction(
            idList: idList,
          ),
        );

class AddLoadingAction {
  final List<LoadingTagModel> list;

  const AddLoadingAction({
    required this.list,
  });
}

class CancelLoadingAction {
  final String id;

  const CancelLoadingAction({
    required this.id,
  });
}

class RemoveLoadingAction {
  final List<String> idList;

  const RemoveLoadingAction({
    required this.idList,
  });
}
