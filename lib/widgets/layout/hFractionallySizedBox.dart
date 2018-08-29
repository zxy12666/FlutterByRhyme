import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FractionallySizedBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/FractionallySizedBox';
  final String detail =
      '''A widget that sizes its child to a fraction of the total available space. For more details about the layout algorithm, see RenderFractionallySizedOverflowBox.
See also:
Align, which sizes itself based on its child's size and positions the child according to an Alignment value.
OverflowBox, a widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.
The catalog of layout widgets.''';

  @override
  _FractionallySizedBoxDemoState createState() =>
      _FractionallySizedBoxDemoState();
}

class _FractionallySizedBoxDemoState
    extends ExampleState<FractionallySizedBoxDemo> {
  FractionallySizedBoxSetting setting;

  @override
  void initState() {
    setting = FractionallySizedBoxSetting(
      widthFactor: doubleMiniValues[0],
      heightFactor: doubleMiniValues[0],
      alignment: alignmentValues[0],
      child: _formatValue(),
    );
    super.initState();
  }
  Widget _formatWidget(){
    return FractionallySizedBox(
      alignment: setting?.alignment?.value??alignmentValues[0].value,
      widthFactor: setting?.widthFactor?.value??null,
      heightFactor: setting?.heightFactor?.value??null,
      child: SizedBox(
        width: 35.0,
        height: 35.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
        ),
      ),
    );
  }

  String _formatLabel(){
    return '''FractionallySizedBox(
      alignment: ${setting?.alignment?.label??''},
      widthFactor: ${setting?.widthFactor?.label??''},
      heightFactor: ${setting?.heightFactor?.label??''},
      child: SizedBox(
        width: 35.0,
        height: 35.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
        ),
      ),
      ),
    )''';
  }

  Value<Widget> _formatValue(){
    return Value(
      value: _formatWidget(),
      label: _formatLabel(),
    );
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return setting?.child?.label;
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value) {
        setting = setting.copyWith(alignment: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      }),
      ValueTitleWidget(StringParams.kWidthFactor),
      SeekBarGroupWidget(setting.widthFactor, (value){
        setting=setting.copyWith(widthFactor: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      },max: 2.0,min: 0.0,),
      ValueTitleWidget(StringParams.kHeightFactor),
      SeekBarGroupWidget(setting.heightFactor, (value){
        setting=setting.copyWith(heightFactor: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      },max: 2.0,min: 0.0,),
    ];
  }

  @override
  String getTitle() {
    return 'FractionallySizedBox';
  }

  @override
  Widget getWidget() {
    return FractionallySizedBox(
      widthFactor: setting.widthFactor?.value,
      heightFactor: setting.heightFactor?.value,
      alignment: setting.alignment?.value,
    );
  }
}

class FractionallySizedBoxSetting {
  final Value<double> widthFactor;
  final Value<double> heightFactor;
  final Value<AlignmentGeometry> alignment;
  final Value<Widget> child;

  FractionallySizedBoxSetting({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
    this.child,
  });

  FractionallySizedBoxSetting copyWith({
    Value<double> widthFactor,
    Value<double> heightFactor,
    Value<AlignmentGeometry> alignment,
     Value<Widget> child,
  }) {
    return FractionallySizedBoxSetting(
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
      alignment: alignment ?? this.alignment,
      child: child??this.child,
    );
  }
}
