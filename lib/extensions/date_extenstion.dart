/// funtion who return current datetime
// ignore_for_file: unnecessary_this

DateTime gtNowdate({
  bool dateonly = false,
}) {
  final date = DateTime.now();
  if (dateonly) {
    return DateTime(date.year, date.month, date.day);
  } else {
    return date;
  }
}

/// funtion by which we can add/ substract dats, months, years from datetime
DateTime gtDateDiffrence(
    {int? days, int? month, int? years, DateTime? initDatetime}) {
  final now = initDatetime ?? gtNowdate();
  return DateTime(
      now.year + (years ?? 0), now.month + (month ?? 0), now.day + (days ?? 0));
}

/// function to know diffrence between two date in days
int gtDaterangediff({
  required DateTime fromdate,
  required DateTime todate,
}) {
  final data = todate.difference(fromdate);
  return (data.inDays + 1);
}

extension DateTimeExt on DateTime {
  DateTime get dateonly {
    return DateTime(this.year, this.month, this.day);
  }

  DateTime get removeMili {
    return DateTime(
        this.year, this.month, this.day, this.hour, this.minute, this.second);
  }
}
