enum Environment { DEV, STAGING, PROD }

class NetworkKeys {
  static const env = Environment.DEV;
  static const String sslFingerprint =
      "7E:B8:AE:42:74:B4:4F:AB:FC:07:8F:A5:2A:1D:3E:A0:6D:D1:33:96:97:CA:1D:E6:4D:2F:DD:E5:D8:6F:21:E5";
  static const String applicationId = "e5a3b2e3-ef89-45e6-bcd0-6e9f33bbd287";
  static const String hmacKey =
      "D*G-KaPdSgVkYp3s6v9y\$B&E)H+MbQeThWmZq4t7w!z%C*F-JaNcRfUjXn2r5u8x";
  static const String salt = "FdeY!X3#k-yA";
  static String jwtImageAPIKey() {
    if (env == Environment.DEV) {
      return "911ceafe-d6eb-4b06-9114-2d896e729c3b";
    } else {
      return "7657ed95-be4b-45af-a913-ba45e45c796e";
    }
  }

  static String jwtApplicationId() {
    if (env == Environment.DEV) {
      return "86b8915d-acf8-44a0-964f-0e0ffe6c1abc";
    } else {
      return "0d86dc30-0991-4a61-954d-55aec56d0979";
    }
  }
}
