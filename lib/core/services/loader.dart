import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/assets.dart';
import '../flavors.dart';

class Loader {
  Loader._();

  late BuildContext _context;
  late BuildContext _dismissingContext;
  Completer waitForLoader = Completer()..complete();

  static Loader _instance = Loader._();

  static Loader get instance => _instance;

  static void newInstance() => _instance = Loader._();

  void hide() {
    if (!waitForLoader.isCompleted) {
      try {
        if (Navigator.of(_dismissingContext).canPop()) {
          Navigator.of(_dismissingContext).pop(true);
        }
      } catch (_) {}
    }
  }

  void show(BuildContext context) {
    _context = context;
    if (waitForLoader.isCompleted) {
      waitForLoader = Completer();
      showDialog<dynamic>(
        context: _context,
        barrierDismissible: kDebugMode,
        builder: (BuildContext context) {
          _dismissingContext = context;
          return WillPopScope(
            onWillPop: () async => false,
            child: const LoadingImage(),
          );
        },
      );
    }
  }
}

class LoadingImage extends StatefulWidget {
  const LoadingImage({Key? key}) : super(key: key);

  @override
  State<LoadingImage> createState() => _LoadingImageState();
}

class _LoadingImageState extends State<LoadingImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: mockApp
          ? const Text('loading')
          : Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: AppColors.white,
              ),
              child: Image.asset(Assets.loading),
            ),
    );
  }

  @override
  void dispose() {
    if (!Loader.instance.waitForLoader.isCompleted) {
      Loader.instance.waitForLoader.complete();
    }
    super.dispose();
  }
}
