import 'package:flutter_news_sample/exception/app_exception.dart';
import 'package:flutter_news_sample/feature/localization/hook/use_l10n.dart';

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
  String messageByL10n(L10n l10n) {
    switch (statusCode) {
      case 400:
        return l10n.appHttpExceptionBadRequestMessage;
      case 401:
        return l10n.appHttpExceptionUnauthorizedMessage;
      case 402:
        return l10n.appHttpExceptionPaymentRequiredMessage;
      case 403:
        return l10n.appHttpExceptionForbiddenMessage;
      case 404:
        return l10n.appHttpExceptionNotFoundMessage;
      case 405:
        return l10n.appHttpExceptionMethodNotAllowedMessage;
      case 406:
        return l10n.appHttpExceptionNotAcceptableMessage;
      case 407:
        return l10n.appHttpExceptionProxyAuthenticationRequiredMessage;
      case 408:
        return l10n.appHttpExceptionRequestTimeoutMessage;
      case 409:
        return l10n.appHttpExceptionConflictMessage;
      case 410:
        return l10n.appHttpExceptionGoneMessage;
      case 411:
        return l10n.appHttpExceptionLengthRequiredMessage;
      case 412:
        return l10n.appHttpExceptionPreconditionFailedMessage;
      case 413:
        return l10n.appHttpExceptionPayloadTooLargeMessage;
      case 414:
        return l10n.appHttpExceptionUriTooLongMessage;
      case 415:
        return l10n.appHttpExceptionUnsupportedMediaTypeMessage;
      case 416:
        return l10n.appHttpExceptionRangeNotSatisfiableMessage;
      case 417:
        return l10n.appHttpExceptionExpectationFailedMessage;
      case 418:
        return l10n.appHttpExceptionIAmATeapotMessage;
      case 421:
        return l10n.appHttpExceptionMisdirectedRequestMessage;
      case 422:
        return l10n.appHttpExceptionUnprocessableEntityMessage;
      case 423:
        return l10n.appHttpExceptionLockedMessage;
      case 424:
        return l10n.appHttpExceptionFailedDependencyMessage;
      case 425:
        return l10n.appHttpExceptionTooEarlyMessage;
      case 426:
        return l10n.appHttpExceptionUpgradeRequiredMessage;
      case 428:
        return l10n.appHttpExceptionPreconditionRequiredMessage;
      case 429:
        return l10n.appHttpExceptionTooManyRequestsMessage;
      case 431:
        return l10n.appHttpExceptionRequestHeaderFieldsTooLargeMessage;
      case 451:
        return l10n.appHttpExceptionUnavailableForLegalReasonsMessage;
      case 500:
        return l10n.appHttpExceptionInternalServerErrorMessage;
      case 501:
        return l10n.appHttpExceptionNotImplementedMessage;
      case 502:
        return l10n.appHttpExceptionBadGatewayMessage;
      case 503:
        return l10n.appHttpExceptionServiceUnavailableMessage;
      case 504:
        return l10n.appHttpExceptionGatewayTimeoutMessage;
      case 505:
        return l10n.appHttpExceptionHttpVersionNotSupportedMessage;
      case 506:
        return l10n.appHttpExceptionVariantAlsoNegotiatesMessage;
      case 507:
        return l10n.appHttpExceptionInsufficientStorageMessage;
      case 508:
        return l10n.appHttpExceptionLoopDetectedMessage;
      case 510:
        return l10n.appHttpExceptionNotExtendedMessage;
      case 511:
        return l10n.appHttpExceptionNetworkAuthenticationRequiredMessage;
      default:
        return l10n.appHttpExceptionDefaultMessage(statusCode ?? 0);
    }
  }
}
