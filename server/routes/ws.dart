import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

Future<Response> onRequest(RequestContext context) async {
  final apiKey = Platform.environment['GEMINI_APIKEY'];

  final handler = webSocketHandler(
    (channel, protocol) {
      // check open socket
      print('socket opened');

      // listen stream from client
      channel.stream.listen(
        (event) {
          final prompt = '$event';
          final model =
              GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey!);

          final stream = model.generateContentStream([Content.text(prompt)]);

          stream.listen((data) {
            // send message to client
            channel.sink.add(data.text ?? '');
          });
        },
        onDone: () => print('socket disconnected'),
      );
    },
  );

  return handler(context);
}
