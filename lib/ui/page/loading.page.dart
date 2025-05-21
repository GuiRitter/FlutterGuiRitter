import 'package:flutter/material.dart'
    show
        Align,
        AlignmentDirectional,
        BuildContext,
        CircularProgressIndicator,
        Column,
        CrossAxisAlignment,
        ElevatedButton,
        Expanded,
        ListView,
        MainAxisAlignment,
        MediaQuery,
        Positioned,
        Scaffold,
        SizedBox,
        Stack,
        StatelessWidget,
        Text,
        Widget;
import 'package:flutter_guiritter/model/model.import.dart'
    show StateModelWrapper;
import 'package:flutter_guiritter/model/model.import.dart' show LoadingTagModel;
import 'package:flutter_guiritter/redux/loading/action.dart' as loading_action;
import 'package:flutter_guiritter/redux/redux.import.dart' show dispatch;
import 'package:flutter_guiritter/ui/widget/widget.import.dart'
    show AppBarCustomWidget;
import 'package:flutter_guiritter/util/util.import.dart' show logger;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

final _log = logger('LoadingPage');

class LoadingPage extends StatelessWidget {
  final Widget title;

  const LoadingPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      StoreConnector<Map<String, dynamic>, List<LoadingTagModel>>(
        distinct: true,
        converter: StateModelWrapper.selectLoadingTagList,
        builder: connectorBuilder,
      );

  Widget connectorBuilder(
    BuildContext context,
    List<LoadingTagModel> loadingTagList,
  ) {
    final mediaSize = MediaQuery.of(
      context,
    ).size;

    _log('connectorBuilder').mapList('loadingTagList', loadingTagList).print();

    return Scaffold(
      appBar: AppBarCustomWidget(
        title: title,
      ),
      body: SizedBox(
        height: mediaSize.height,
        width: mediaSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: loadingTagList.length,
                itemBuilder: (
                  context,
                  index,
                ) =>
                    Align(
                  child: ElevatedButton(
                    onPressed: () => onCancelPressed(
                      context: context,
                      id: loadingTagList[index].id,
                    ),
                    child: Text(
                      '🛑 ${loadingTagList[index].userFriendlyName} 🛑',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onCancelPressed({
    required BuildContext context,
    required String id,
  }) {
    _log('onCancelPressed').raw('id', id).print();

    dispatch(
      loading_action.cancel(
        id: id,
      ),
    );
  }
}
