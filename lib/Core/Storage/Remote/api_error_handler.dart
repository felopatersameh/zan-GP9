import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  static Failure fromDioError(DioException error) {
    if (error.response?.statusCode == 401) {
      return const UnauthenticatedFailure();
    }

    if (error.response != null) {
      final serverMessage = _extractServerMessage(error.response?.data);
      if (serverMessage.isNotEmpty) {
        return ServerFailure(serverMessage);
      }
      if (error.response?.statusCode != null) {
        return ServerFailure(_handleStatusCode(error.response!.statusCode!));
      }
    }

    return ServerFailure(_handleDioError(error));
  }

  static String _handleStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return "🔴 الطلب غير صحيح. رجاء راجع البيانات المدخلة.";
      case 402:
        return "💰 الدفع مطلوب. رجاء تأكد من بيانات الدفع.";
      case 403:
        return "🚫 الوصول مرفوض.";
      case 404:
        return "🔍 لم يتم العثور على المورد.";
      case 405:
        return "❌ الطريقة غير مسموح بها.";
      case 408:
        return "⏳ انتهى وقت الطلب. حاول تاني بعد شوية.";
      case 429:
        return "⚠️ طلبات كتير جدًا. حاول تبطأ شوية.";
      case 500:
        return "🔥 خطأ داخلي في السيرفر.";
      case 502:
        return "🌐 بوابة غير صالحة.";
      case 503:
        return "🚧 الخدمة غير متوفرة حالياً.";
      case 504:
        return "⏱ انتهى وقت الاستجابة من البوابة.";
      default:
        return "❓ حصل خطأ غير متوقع. كود الحالة: $statusCode";
    }
  }

  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "⏳ انتهت مهلة الاتصال. رجاء تأكد من الإنترنت.";
      case DioExceptionType.sendTimeout:
        return "📤 الطلب خد وقت طويل في الإرسال.";
      case DioExceptionType.receiveTimeout:
        return "📥 السيرفر استغرق وقت طويل للرد.";
      case DioExceptionType.badCertificate:
        return "🔐 شهادة SSL غير صالحة.";
      case DioExceptionType.badResponse:
        return "⚠️ رد غير صالح من السيرفر.";
      case DioExceptionType.cancel:
        return "❌ الطلب اتلغى.";
      case DioExceptionType.connectionError:
        return "📶 مفيش اتصال بالإنترنت.";
      default:
        return "❓ حصل خطأ غير معروف. حاول تاني.";
    }
  }

  static String _extractServerMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message']?.toString() ?? data['error']?.toString() ?? '';
    }
    return data?.toString() ?? '';
  }
}

class UnauthenticatedFailure extends Failure {
  const UnauthenticatedFailure()
      : super("🔑 الوصول غير مصرح. رجاء سجل الدخول تاني.");
}
