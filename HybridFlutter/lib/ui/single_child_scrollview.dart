import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hybrid_flutter/entity/component.dart';
import 'package:hybrid_flutter/ui/base_widget.dart';

import 'basic.dart';

class SingleChildScrollViewStateless extends BaseWidget {
  SingleChildScrollViewStateless(
      BaseWidget parent,
      String pageId,
      MethodChannel methodChannel,
      Component component) {
    this.parent = parent;
    this.pageId = pageId;
    this.methodChannel = methodChannel;
    this.component = component;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        key: ObjectKey(component),
        scrollDirection: MAxis.parse(component.properties["scrollDirection"],
            defaultValue: Axis.vertical),
        child: ValueListenableBuilder(
            builder:
                (BuildContext context, List<BaseWidget> value, Widget child) {
              return value.length > 0 ? value[0] : null;
            },
            valueListenable: children));
  }

}
