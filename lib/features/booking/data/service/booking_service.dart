import 'dart:convert';

import 'package:cydrerie/core/constants/api_links.dart';
import 'package:cydrerie/core/constants/success_messages.dart';
import 'package:cydrerie/features/booking/domain/repository/booking_repository.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/error_messages.dart';
import '../../../../core/exception/api.dart';
import '../model/booking_model.dart';

class BookingService implements BookingRepository {
  @override
  Future<List<Booking>> fetchBookings() async {

    final url =
        "${ApiConstants.baseRequestURL}"
        "${ApiConstants.bookingEndpoint}"
        "${ApiConstants.getItems}";

    try {
      final r = await http.get(Uri.parse(url));
      final data = _handleResponse(r);
      final fetched = data.map((b) => Booking.fromJson(b)).toList();
      print(fetched);
      return fetched;
    } catch (er) {
      throw Exception(er);
    }
  }

  @override
  Future<Booking> fetchBookingById(int id) async {
    final url =
        "${ApiConstants.baseRequestURL}"
        "${ApiConstants.bookingEndpoint}"
        "${ApiConstants.getItems}/$id";

    try {
      final r = await http.get(Uri.parse(url));
      final data = _handleResponse(r);
      return Booking.fromJson(data);
    } catch (er) {
      throw Exception(er);
    }
  }

  @override
  Future<Booking> createBooking(Booking booking) async {

    final url =
        "${ApiConstants.baseRequestURL}"
        "${ApiConstants.bookingEndpoint}"
        "${ApiConstants.createItem}";

    try {
      final res = await http.patch(
        Uri.parse(url),
        headers: _headers,
        body: jsonEncode(booking.toJson()),
      );

      final data = _handleResponse(res);
      return Booking.fromJson(data);
    } catch (er) {
      throw Exception(er);
    }

  }

  @override
  Future<String> cancelBooking(int id) async {
    final url =
        "${ApiConstants.baseRequestURL}"
        "${ApiConstants.bookingEndpoint}"
        "${ApiConstants.deleteItem}/$id";

    final res = await http.delete(Uri.parse(url));
    _handleResponse(res);

    return SuccessMessages.bookingDeleted;
  }

  @override
  Future<Booking> updateBooking(Booking booking) async {

    final url =
        "${ApiConstants.baseRequestURL}"
        "${ApiConstants.bookingEndpoint}"
        "${ApiConstants.updateItem}";

    final res = await http.patch(
      Uri.parse(url),
      headers: _headers,
      body: jsonEncode(booking.toJson()),
    );

    final data = _handleResponse(res);
    return Booking.fromJson(data);

  }

  dynamic _handleResponse(http.Response res) {
    if (res.statusCode >= 200 && res.statusCode < 300) {
      if (res.body.isNotEmpty) {
        return jsonDecode(res.body);
      } else {
        return null;
      }
    }

    switch (res.statusCode) {
      case 401:
        throw ApiException(ErrorMessages.unauthorized, code: 401);
      case 404:
        throw ApiException(ErrorMessages.menuNotFound, code: 404);
      case 500:
        throw ApiException(ErrorMessages.serverError, code: 500);
      default:
        throw ApiException(ErrorMessages.genericApi, code: res.statusCode);
    }
  }

  Map<String, String> get _headers =>
      {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'User-Agent': 'CydrerieApp/1.0.0'
      };

}