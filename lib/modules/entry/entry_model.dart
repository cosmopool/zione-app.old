abstract class Entry {
  Map toMap();
  Map mapToOpenEntry();
  Future<Map> post();
  Future<Map> delete();
  Future<Map> close();
}
