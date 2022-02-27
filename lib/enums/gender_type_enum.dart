// ignore_for_file: constant_identifier_names
enum GenderTypeEnum { MALE, FEMALE, NON }

class GenderTypeEnumConverter {
  static String fromEnum(GenderTypeEnum gender) {
    if (gender == GenderTypeEnum.MALE) {
      return 'MALE';
    } else if (gender == GenderTypeEnum.FEMALE) {
      return 'FEMALE';
    } else {
      return 'NON';
    }
  }

  static GenderTypeEnum fromString(String gender) {
    if (gender == 'MALE') {
      return GenderTypeEnum.MALE;
    } else if (gender == 'FEMALE') {
      return GenderTypeEnum.FEMALE;
    } else {
      return GenderTypeEnum.NON;
    }
  }
}
