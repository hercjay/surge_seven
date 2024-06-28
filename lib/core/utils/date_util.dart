

class DateUtil {
  
static String formatDate(String dateStr) {
  DateTime date = DateTime.parse(dateStr);

  String monthInWords = '';
  
  switch (date.month) {
    case 1:
      monthInWords = 'January';
      break;
    case 2:
      monthInWords = 'February';
      break;
    case 3:
      monthInWords = 'March';
      break;
    case 4:
      monthInWords = 'April';
      break;
    case 5:
      monthInWords = 'May';
      break;
    case 6:
      monthInWords = 'June';
      break;
    case 7:
      monthInWords = 'July';
      break;
    case 8:
      monthInWords = 'August';
      break;
    case 9:
      monthInWords = 'September';
      break;
    case 10:
      monthInWords = 'October';
      break;
    case 11:
      monthInWords = 'November';
      break;
    case 12:
      monthInWords = 'December';
      break;
  }

  return '${date.day}/$monthInWords/${date.year}';
}

}