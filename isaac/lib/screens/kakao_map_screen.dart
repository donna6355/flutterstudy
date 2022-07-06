import 'package:flutter/material.dart';
import 'package:isaac/providers/user_state.dart';
import 'package:provider/provider.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:isaac/keys/auth_key.dart';

const String kakaoMapKey = Kakao.appKey;

class KakaoMapScreen extends StatelessWidget {
  const KakaoMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Consumer<UserState>(builder: (_, user, child) {
          return Text(user.userName);
        })),
        body: Center(
          child: KakaoMapView(
              width: 400,
              height: 400,
              kakaoMapKey: kakaoMapKey,
              lat: 33.450701,
              lng: 126.570667,
              showMapTypeControl: false,
              showZoomControl: false,
              onTapMarker: (message) {
                //event callback when the marker is tapped
              }),
        ));
  }
}
