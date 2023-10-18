class StringHelper {
  static String capitalize(String string) {
    List<String> auxiliarString = string.split('');
    auxiliarString[0] = auxiliarString[0].toUpperCase();

    for (int i = 0; i < auxiliarString.length; i++) {
      if (auxiliarString[i] == ' ') {
        auxiliarString[i + 1] = auxiliarString[i + 1].toUpperCase();
      }
    }

    return auxiliarString.join('');
  }
}
