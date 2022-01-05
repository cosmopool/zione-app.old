import 'package:zione_app/repositories/response_repository.dart';

abstract class AgendaEntry {
  Future<Response> post();
  Future<Response> update();
  Future<Response> delete();
  Future<Response> close();
  Map toMap();
}
