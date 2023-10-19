// ignore_for_file: constant_identifier_names

enum StatusEnum { TO_DO, IN_PROGRESS, DONE, ALL }

extension StatusEnumExtension on StatusEnum {
  String get name {
    switch (this) {
      case StatusEnum.TO_DO:
        return "To Do";
      case StatusEnum.IN_PROGRESS:
        return "In Progress";
      case StatusEnum.DONE:
        return "Done";
      case StatusEnum.ALL:
        return "Status";
      default:
        return "";
    }
  }

  String get enumName {
    switch (this) {
      case StatusEnum.TO_DO:
        return "TO_DO";
      case StatusEnum.IN_PROGRESS:
        return "IN_PROGRESS";
      case StatusEnum.DONE:
        return "DONE";
      default:
        return "";
    }
  }

  static StatusEnum fromString(String string) {
    switch (string) {
      case "TO_DO":
        return StatusEnum.TO_DO;
      case "IN_PROGRESS":
        return StatusEnum.IN_PROGRESS;
      case "DONE":
        return StatusEnum.DONE;
      default:
        return StatusEnum.TO_DO;
    }
  }
}
