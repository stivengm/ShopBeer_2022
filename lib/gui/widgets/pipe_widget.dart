import 'package:intl/intl.dart';

class PipeWidget {

  formato(int valor) {
    String valueFormat = NumberFormat.decimalPattern('en_US').format(valor);
    valueFormat = valueFormat.replaceAll(',', '.');
    return valueFormat;
  }

}