class SecureValues {
  String id;
  String host;
  String port;
  SecureValues({required this.id, required this.host, required this.port});

  factory SecureValues.fromMap(Map<String, String> map) {
    return SecureValues(
      id: map['id'] ?? 'default',
      host: map['host'] ?? 'default',
      port: map['port'] ?? 'default',
    );
  }
}
