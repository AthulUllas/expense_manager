String maskNumber(String number) {
  if (number.length < 6) return number;

  return "${number.substring(0, 4)}****${number.substring(number.length - 2)}";
}
