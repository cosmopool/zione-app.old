import 'package:zione_app/core/constants.dart';

import 'package:zione_app/modules/agenda/agenda_entry_model.dart';
import 'package:zione_app/repositories/response_repository.dart';
import 'package:zione_app/services/rest_api_service.dart';


class EntryRepository {
  final ApiRequests requests = ApiRequests();

  Future<Response> fetchContent(Endpoint endpoint) async {
    // if online, fetch from server
    final result = await requests.fetchContentFromServer(endpoint);
    // TODO: if it is not possible to fetch from server, use cache
    return result;
  }

  Future<Response> postContent(Endpoint endpoint, AgendaEntry entry) async {
    // TODO: if it is not possible to post to server, use cache
    final result = await requests.postContentToServer(endpoint, entry.toMap());
    return result;
  }

  Future<Response> closeContent(Endpoint endpoint, AgendaEntry entry) async {
    // TODO: if it is not possible to close from server, use cache
    final result = await requests.closeContentFromServer(endpoint, entry.toMap());
    return result;
  }

  Future<Response> updateContent(Endpoint endpoint, AgendaEntry entry) async {
    // TODO: if it is not possible to update from server, use cache
    final result = await requests.updateContentFromServer(endpoint, entry.toMap());
    return result;
  }

  Future<Response> deleteContent(Endpoint endpoint, AgendaEntry entry) async {
    // TODO: if it is not possible to delete from server, use cache
    final result = await requests.deleteContentFromServer(endpoint, entry.toMap());
    return result;
  }
}
