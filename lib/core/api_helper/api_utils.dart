enum Client { testing, uat, release, dev }

extension on Client {
  String get link => switch (this) {
        Client.dev => 'https://www.example.com/dev/',
        Client.testing => 'https://www.example.com/testing/',
        Client.uat => 'https://www.example.com/uat/',
        Client.release => 'https://www.example.com/release/',
      };
}

class APIUtils {
  static var apiEndPoint = Client.uat.link;
}
