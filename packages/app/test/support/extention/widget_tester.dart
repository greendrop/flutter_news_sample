// ref: https://stevenosse.com/taking-screenshots-during-flutter-widget-testing

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterScreenshot on WidgetTester {
  Future<void> takeScreenshot({required String name}) async {
    final liveElement = binding.rootElement!;

    late final Uint8List bytes;
    await binding.runAsync(() async {
      final image = await _captureImage(liveElement);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        return 'Could not take screenshot';
      }
      bytes = byteData.buffer.asUint8List();
      image.dispose();
    });

    final directory = Directory('./screenshots');
    if (!directory.existsSync()) {
      directory.createSync();
    }
    File('./screenshots/$name.png').writeAsBytesSync(bytes);
  }

  Future<ui.Image> _captureImage(Element element) async {
    assert(element.renderObject != null);
    var renderObject = element.renderObject!;
    while (!renderObject.isRepaintBoundary) {
      renderObject = renderObject.parent!;
    }
    assert(!renderObject.debugNeedsPaint);

    final layer = renderObject.debugLayer! as OffsetLayer;
    final image = await layer.toImage(renderObject.paintBounds);

    if (element.renderObject is RenderBox) {
      final expectedSize = (element.renderObject as RenderBox?)!.size;
      if (expectedSize.width != image.width ||
          expectedSize.height != image.height) {
        final el = element.toStringShort();
        // ignore: avoid_print
        print(
          'Warning: The screenshot captured of $el is '
          'larger (${image.width}, ${image.height}) than '
          '$el (${expectedSize.width}, ${expectedSize.height}) itself.\n'
          // ignore: lines_longer_than_80_chars
          'Wrap the $el in a RepaintBoundary to be able to capture only that layer.',
        );
      }
    }

    return image;
  }
}
