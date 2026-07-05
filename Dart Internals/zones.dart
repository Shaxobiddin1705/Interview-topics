import 'dart:async';

/// Zones

/*
* Zone bu sizning asynchronous codelaringizni boshqarish imkonini beradi.
* U orqali siz asynchronous codelaringizni izohlash, xatoliklarni ushlash mumkun, 
* custom print yaratish va qiymat ham kiritish mumkun.
*/
void main() {
  runZonedGuarded(
    () {
      print('Loading user...');
      print('Fetching profile...');
      print('Done');
    },
    (error, stackTrace) {
      print('Caught an error: $error');
    },
    zoneValues: {'request-id': '123'},
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, message) {
        parent.print(zone, '[REQ-${Zone.current['request-id']}]: $message');
      },
    ),
  );
}
