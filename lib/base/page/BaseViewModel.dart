

import 'package:flutter/widgets.dart';
import 'package:my_app/base/custom/load_state_layout.dart';


class BaseViewModel<BuildContext> extends ChangeNotifier{

  BuildContext context;
  /// 加载状态
  LoadState loadState;

  BaseViewModel(BuildContext myContext){
    context = myContext;
  }


}