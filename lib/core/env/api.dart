class Env {
  static final Env instance = Env._();
  Env._();
  String ip = 'http://159.69.188.101:2023';
  static final String envIp = instance.ip;
}
