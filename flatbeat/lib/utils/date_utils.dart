class DateUtils {
  static bool areDatesSameDay(DateTime first, DateTime second) {
    final sameYear = first.year == second.year;
    final sameMonth = first.month == second.month;
    final sameDay = first.day == second.day;
    return sameYear && sameMonth && sameDay;
  }
}
