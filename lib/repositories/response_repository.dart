enum Status { success, err }

class Response {
  late Status status;
  late String message;

  Response(Map json) {
    switch (json['Status']) {
      case 'Success': { status = Status.success; } break;
      case 'Error': { status = Status.err; } break;
      default: { status = Status.err; } break;
    }

    if (json['Message'] != null) {
      message = json['Message'] as String;
    } else {
      message = json as String;
    }
  }
}


