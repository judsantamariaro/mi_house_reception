class CustomDateUtils {
  static String getGreeting() {
    final date = DateTime.now();
    if (date.hour < 12) {
      return 'dias';
    } else if (date.hour < 18) {
      return 'tardes';
    } else {
      return 'noches';
    }
  }

  static String getFormattedDate() {
    final date = DateTime.now();
    return '${date.day}/${date.month}/${date.year}';
  }
}
