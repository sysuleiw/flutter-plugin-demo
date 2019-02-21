import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class FlutterPluginDemo {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_demo');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

class TestUIView extends StatelessWidget {
  TestUIView({Key key, this.labelText}) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: 'plugins.flutter.io/testUIView',
      creationParams: _CreationParams.fromWidget(this).toMap(),
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}

class _CreationParams {
  _CreationParams({this.labelText});

  static _CreationParams fromWidget(TestUIView widget) {
    return _CreationParams(
      labelText: widget.labelText,
    );
  }

  final String labelText;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'labelText': labelText,
    };
  }
}
