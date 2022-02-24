enum UserTypeEnum { STAFF, DOCTOR }

class UserTypeEnumConverter {
  static String fromEnum(UserTypeEnum type) {
    if (type == UserTypeEnum.DOCTOR) {
      return 'DOCTOR';
    } else {
      return 'STAFF';
    }
  }

  static UserTypeEnum fromString(String type) {
    if (type == 'DOCTOR') {
      return UserTypeEnum.DOCTOR;
    } else {
      return UserTypeEnum.STAFF;
    }
  }
}
