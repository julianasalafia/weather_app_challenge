extension DateTimeExtension on DateTime {
  String toPTBR() {
    final months = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro'
    ];

    int currentDay = day;
    String currentMonth = months[month - 1];
    int currentYear = year;

    return '$currentDay de $currentMonth de $currentYear';
  }
}
