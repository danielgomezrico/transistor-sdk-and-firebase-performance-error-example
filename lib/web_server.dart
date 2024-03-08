import 'dart:convert' show utf8;
import 'dart:convert';
import 'dart:io';

const _tag = '[http][server]';

class WebServer {
  HttpServer? _server;

  Future<void> start(int port) async {
    close();

    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
    _server = server;

    print(
        "$_tag Server running on IP : ${server.address} On Port : ${server.port}");
  }

  Stream<BasicRequest> listenRequests() async* {
    final server = _server;
    if (server == null) throw Exception('Server not started');

    await for (var request in server) {
      final body = await utf8.decodeStream(request);
      yield BasicRequest(request.uri, request.method, body);

      request.response
        ..statusCode = 200
        ..headers.contentType = ContentType(
          "text",
          "application/json",
          charset: "utf-8",
        )
        ..write('Received');

      await request.response.close();
    }
  }

  void close() {
    _server?.close(force: true);
  }
}

class BasicRequest {
  const BasicRequest(this.uri, this.method, this.body);

  final Uri uri;
  final String method;
  final String body;

  @override
  String toString() {
    return 'BasicResponse{uri: $uri, method: $method, body: $body}';
  }
}
