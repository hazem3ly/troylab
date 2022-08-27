
import '../data/api_manager.dart';
import '../flavors.dart';
import '../utils/request_to_curl.dart';

class Crashlytics {
  Crashlytics._();

  static final _instance = Crashlytics._();
  static Crashlytics get instance => _instance;

  Future<void> recordError(ReportableFailure? failure) async {
    if (failure == null) return;
    final request = failure.failureInfo.request;
    final response = failure.failureInfo.response;
    final exception = failure.failureInfo.exception;
    final type = failure.type;

   
  }

  Future<void> recordTypeError(TypeFailure? failure, String type) async {
    if (failure == null) return;
  }
}
