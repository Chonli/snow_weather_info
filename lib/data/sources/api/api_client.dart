import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/cached_list.dart';

part 'api_client.g.dart';

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  return ApiClient(Client());
}

/// Enveloppe le [Client] http avec la logique de requête conditionnelle :
/// si `etag` est fourni, il est envoyé dans `If-None-Match` et une réponse
/// 304 est traduite en `RemoteResult.notModified` (aucun transfert de corps).
class ApiClient {
  const new(this.client);

  final Client client;

  Future<RemoteResult<T>?> getConditional<T>(
    Uri url, {
    required T Function(Response response) decode,
    String? etag,
  }) async {
    final headers = <String, String>{'If-None-Match': ?etag};

    final response = await client.get(
      url,
      headers: headers.isEmpty ? null : headers,
    );
    if (response.statusCode == 304) return const RemoteResult.notModified();
    if (response.statusCode != 200) return null;

    return RemoteResult<T>(decode(response), etag: response.headers['etag']);
  }
}
