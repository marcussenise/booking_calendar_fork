import 'package:example/src/core/booking_calendar.dart';
import 'package:example/src/core/booking_controller.dart';
import 'package:example/src/model/booking_service_model.dart';
import 'package:example/src/model/enums.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting()
      .then((_) => runApp(const BookingCalendarDemoApp()));
}

class BookingCalendarDemoApp extends StatefulWidget {
  const BookingCalendarDemoApp({Key? key}) : super(key: key);

  @override
  State<BookingCalendarDemoApp> createState() => _BookingCalendarDemoAppState();
}

class _BookingCalendarDemoAppState extends State<BookingCalendarDemoApp> {
  final now = DateTime.now();
  late BookingServiceModel mockBookingService;
  late BookingController bookingController = BookingController(bookingService: mockBookingService);

  @override
  void initState() {
    super.initState();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    mockBookingService = BookingServiceModel(
      carro: 'Renault Zoe def6523',
      data: "04/06/2023",
      horario: "17:11",
      localRecarga: "CEP: 70294080 Brasília",
      statusRecarga: "solicitado",
      nome: "teste",
      telefone: "(61) 9999-9999",
      bookingEnd: DateTime(now.year, now.month, now.day, 23, 30),
      bookingStart: DateTime(now.year, now.month, now.day, 0, 0),
      serviceDuration: 30,
    );
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock({required BookingServiceModel newBooking, required int selectedSlot}) async {
    mockBookingService.bookingStart = newBooking.bookingStart;
    mockBookingService.bookingEnd = newBooking.bookingStart.add(const Duration(hours: 4));


    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(start: newBooking.bookingStart, end: newBooking.bookingEnd));

  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
    ///disabledDays will properly work with real data
    // DateTime first = now;
    // DateTime tomorrow = now.add(const Duration(days: 1));
    // DateTime second = now.add(const Duration(minutes: 55));
    // DateTime third = now.subtract(const Duration(minutes: 240));
    // DateTime fourth = now.subtract(const Duration(minutes: 500));
    // converted.add(
    //     DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    // converted.add(DateTimeRange(
    //     start: second, end: second.add(const Duration(minutes: 23))));
    // converted.add(DateTimeRange(
    //     start: third, end: third.add(const Duration(minutes: 15))));
    // converted.add(DateTimeRange(
    //     start: fourth, end: fourth.add(const Duration(minutes: 50))));

    // //book whole day example
    // converted.add(DateTimeRange(
    //     start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0),
    //     end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 0)));
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
           end: DateTime(now.year, now.month, now.day, 13, 0));
      return converted;
   }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Booking Calendar Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Booking Calendar Demo'),
          ),
          body: Center(
            child: BookingCalendar(
              bookingService: mockBookingService,
              convertStreamResultToDateTimeRanges: convertStreamResultMock,
              getBookingStream: getBookingStreamMock,
              uploadBooking: uploadBookingMock,
              pauseSlots: generatePauseSlots(),
              pauseSlotText: 'Almoço',
              hideBreakTime: false,
              loadingWidget: const Text('Carregando dados...'),
              uploadingWidget: const SizedBox(width: 14 ,child: CircularProgressIndicator()),
              locale: 'pt_BR',
              startingDayOfWeek: StartingDayOfWeek.sunday,
              wholeDayIsBookedWidget: const Text(
                  'Todos os horários já foram reservados para este dia.'),
              //disabledDates: [DateTime(2023, 1, 20)],
              //disabledDays: [6, 7],
            ),
          ),
        ));
  }
}
