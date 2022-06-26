import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

const String kakaoMapKey = '${YOUR_JAVASCRIPT_KEY}';

class KakaoMapScreen extends StatelessWidget {
  const KakaoMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('KAKAO MAP')),
        body: Center(
          child: KakaoMapView(
              width: 400,
              height: 400,
              kakaoMapKey: kakaoMapKey,
              lat: 33.450701,
              lng: 126.570667,
              showMapTypeControl: true,
              showZoomControl: true,
              markerImageURL:
                  'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
              onTapMarker: (message) {
                //event callback when the marker is tapped
              }),
        ));
  }
}
