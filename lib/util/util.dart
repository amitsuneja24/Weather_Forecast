import 'dart:ffi';

import 'package:intl/intl.dart';

class util{
  static String key = '14c33ba68272235c29c0f7aa2611218b';
  static String getFormattedDate(DateTime date){
    return DateFormat('h:mm a EEE, MMM d, y',).format(date);
  }
  static String getTime(DateTime date){
    return  DateFormat('h:mm a').format(date);
  }

  }
