part of 'authenticator.imports.dart';

enum SessionEvent { sessionExpired, sessionRenewed }

/// The SessionHandler class handles events that affect the state of the
/// application session, such as the user logging in or logging out. The
/// SessionHandler class exposes a stream that allows other parts of the
/// application to listen for changes in the authentication status. The
/// SessionHandler class also exposes a sink that allows other parts of the
/// application to send authentication events to the SessionHandler class.

/// The _authenticationStatus stream controller is used to manage the
/// session status stream. The authSink sink is used to send events to the
/// _authenticationStatus stream controller. The onAuthenticationStatusChanged
/// stream exposes the stream managed by the _authenticationStatus stream
/// controller.

class SessionHandler {
  static final StreamController<SessionEvent> _authenticationStatus =
      StreamController.broadcast();
  static StreamSink<SessionEvent> authSink = _authenticationStatus.sink;
  static Stream<SessionEvent> onAuthenticationStatusChanged =
      _authenticationStatus.stream;

  static void dispose() {
    _authenticationStatus.close();
    authSink.close();
  }
}
