import 'package:flutter_news_sample/config/i18n/strings.g.dart';
import 'package:flutter_news_sample/exception/app_exception.dart';

class AppHttpException extends AppException {
  AppHttpException({this.statusCode, this.body, super.parentException});

  int? statusCode;

  String? body;

  @override
  String get message {
    switch (statusCode) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 402:
        return 'Payment Required';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 405:
        return 'Method Not Allowed';
      case 406:
        return 'Not Acceptable';
      case 407:
        return 'Proxy Authentication Required';
      case 408:
        return 'Request Timeout';
      case 409:
        return 'Conflict';
      case 410:
        return 'Gone';
      case 411:
        return 'Length Required';
      case 412:
        return 'Precondition Failed';
      case 413:
        return 'Payload Too Large';
      case 414:
        return 'URI Too Long';
      case 415:
        return 'Unsupported Media Type';
      case 416:
        return 'Range Not Satisfiable';
      case 417:
        return 'Expectation Failed';
      case 418:
        return "I'm a teapot";
      case 421:
        return 'Misdirected Request';
      case 422:
        return 'Unprocessable Entity';
      case 423:
        return 'Locked';
      case 424:
        return 'Failed Dependency';
      case 425:
        return 'Too Early';
      case 426:
        return 'Upgrade Required';
      case 428:
        return 'Precondition Required';
      case 429:
        return 'Too Many Requests';
      case 431:
        return 'Request Header Fields Too Large';
      case 451:
        return 'Unavailable For Legal Reasons';
      case 500:
        return 'Internal Server Error';
      case 501:
        return 'Not Implemented';
      case 502:
        return 'Bad Gateway';
      case 503:
        return 'Service Unavailable';
      case 504:
        return 'Gateway Timeout';
      case 505:
        return 'HTTP Version Not Supported';
      case 506:
        return 'Variant Also Negotiates';
      case 507:
        return 'Insufficient Storage';
      case 508:
        return 'Loop Detected';
      case 510:
        return 'Not Extended';
      case 511:
        return 'Network Authentication Required';
      default:
        return 'Unknown ($statusCode)';
    }
  }

  @override
  String messageByTranslations(Translations translations) {
    switch (statusCode) {
      case 400:
        return translations.appHttpException.badRequestMessage;
      case 401:
        return translations.appHttpException.unauthorizedMessage;
      case 402:
        return translations.appHttpException.paymentRequiredMessage;
      case 403:
        return translations.appHttpException.forbiddenMessage;
      case 404:
        return translations.appHttpException.notFoundMessage;
      case 405:
        return translations.appHttpException.methodNotAllowedMessage;
      case 406:
        return translations.appHttpException.notAcceptableMessage;
      case 407:
        return translations.appHttpException.proxyAuthenticationRequiredMessage;
      case 408:
        return translations.appHttpException.requestTimeoutMessage;
      case 409:
        return translations.appHttpException.conflictMessage;
      case 410:
        return translations.appHttpException.goneMessage;
      case 411:
        return translations.appHttpException.lengthRequiredMessage;
      case 412:
        return translations.appHttpException.preconditionFailedMessage;
      case 413:
        return translations.appHttpException.payloadTooLargeMessage;
      case 414:
        return translations.appHttpException.uriTooLongMessage;
      case 415:
        return translations.appHttpException.unsupportedMediaTypeMessage;
      case 416:
        return translations.appHttpException.rangeNotSatisfiableMessage;
      case 417:
        return translations.appHttpException.expectationFailedMessage;
      case 418:
        return translations.appHttpException.iAmATeapotMessage;
      case 421:
        return translations.appHttpException.misdirectedRequestMessage;
      case 422:
        return translations.appHttpException.unprocessableEntityMessage;
      case 423:
        return translations.appHttpException.lockedMessage;
      case 424:
        return translations.appHttpException.failedDependencyMessage;
      case 425:
        return translations.appHttpException.tooEarlyMessage;
      case 426:
        return translations.appHttpException.upgradeRequiredMessage;
      case 428:
        return translations.appHttpException.preconditionRequiredMessage;
      case 429:
        return translations.appHttpException.tooManyRequestsMessage;
      case 431:
        return translations.appHttpException.requestHeaderFieldsTooLargeMessage;
      case 451:
        return translations.appHttpException.unavailableForLegalReasonsMessage;
      case 500:
        return translations.appHttpException.internalServerErrorMessage;
      case 501:
        return translations.appHttpException.notImplementedMessage;
      case 502:
        return translations.appHttpException.badGatewayMessage;
      case 503:
        return translations.appHttpException.serviceUnavailableMessage;
      case 504:
        return translations.appHttpException.gatewayTimeoutMessage;
      case 505:
        return translations.appHttpException.httpVersionNotSupportedMessage;
      case 506:
        return translations.appHttpException.variantAlsoNegotiatesMessage;
      case 507:
        return translations.appHttpException.insufficientStorageMessage;
      case 508:
        return translations.appHttpException.loopDetectedMessage;
      case 510:
        return translations.appHttpException.notExtendedMessage;
      case 511:
        return translations
            .appHttpException.networkAuthenticationRequiredMessage;
      default:
        return translations.appHttpException
            .defaultMessage(statusCode: statusCode ?? 0);
    }
  }
}
