import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  return ApiClient(Client());
}

/// Enveloppe le [Client] http : retourne null si le code de réponse n'est
/// pas 200.
class ApiClient {
  const new(this.client);

  final Client client;

  Future<T?> get<T>(
    Uri url, {
    required T Function(Response response) decode,
  }) async {
    final response = await client.get(url);
    if (response.statusCode != 200) return null;

    return decode(response);
  }
}
