import 'dart:math';

class DataMock {
  static String generateMobile() {
    int min = 0;
    int max = 10;
    List prelist = [
      '130',
      '131',
      '132',
      '133',
      '134',
      '135',
      '136',
      '137',
      '138',
      '139',
      '147',
      '150',
      '151',
      '152',
      '153',
      '155',
      '156',
      '157',
      '158',
      '159',
      '166',
      '186',
      '187',
      '188',
      '176',
      '177',
      '199',
    ];
    String left = prelist[Random().nextInt(prelist.length)];
    String right = '';
    for (var i = 0; i < 8; i++) {
      right = right + (min + (Random().nextInt(max - min))).toString();
    }

    return left + right;
  }

  static List<String> generateMultiMobiles(int count) {
    return List<String>.generate(count, (index) => generateMobile());
  }
}
