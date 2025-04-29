import '../../data/model/booking_model.dart';

abstract class BookingRepository {
  Future<List<Booking>> fetchBookings();

  Future<Booking> createBooking(Booking booking);

  Future<String> cancelBooking(int id);

  Future<Booking> updateBooking(Booking booking);
}