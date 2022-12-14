import 'package:calendar_app/model/schedule_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

final addViewModelProvider = StateNotifierProvider<AddViewModel, ScheduleModel>(
  (ref) => AddViewModel(),
);

class AddViewModel extends StateNotifier<ScheduleModel> {
  AddViewModel() : super(ScheduleModel.initial());

//終日スイッチが押された時にtrue,falseの変更
  void changeAllDay(bool onChanged) {
    state = state.copyWith(allDay: onChanged);
  }

  //開始のドラムロールの値が変わった時の関数(年、月、日)
  void newStartDate(DateTime dt) {
    state = state.copyWith(
      startDateTime: dt,
    );
  }

//開始のドラムロールの値が変わった時の関数(時間)
  void newStartTime(DateTime dt) {
    state = state.copyWith(
      startTime: dt,
    );
  }

  //終了のドラムロールの値が変わった時の関数(年、月、日)
  void newEndDate(DateTime dt) {
    state = state.copyWith(
      endDateTime: dt,
    );
  }

//終了のドラムロールの値が変わった時の関数
  void newEndTime(DateTime dt) {
    state = state.copyWith(endTime: dt);
  }

//ドラムロールを表示するときの関数
  void showDialog({required BuildContext context, required Widget child}) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // 下マージンは、ポップアップをシステムの上に揃えるため
              // ナビゲーションバー
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // ポップアップの背景色
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // SafeArea ウィジェットを使用して、システムのオーバーラップを回避
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}

// tittleのテキストとbool
final tittleProvider = StateProvider.autoDispose((ref) {
  return TextEditingController();
});
final isTittleRequestingProvider = StateProvider.autoDispose((ref) => true);

// bodyのテキストとbool
final bodyProvider = StateProvider.autoDispose((ref) {
  return TextEditingController();
});
final isBodyRequestingProvider = StateProvider.autoDispose((ref) => true);
