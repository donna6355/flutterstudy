import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '../widget/message.dart';
import '../widget/new_message.dart';

class Chat extends StatelessWidget {
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),
        actions: [
          DropdownButton(
            underline: Container(), //to removew slight underline
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (item) {
              if (item == 'logout') FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder(
              future: myBanner.load(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final AdWidget adWidget = AdWidget(ad: myBanner);
                final Container adContainer = Container(
                  alignment: Alignment.center,
                  child: adWidget,
                  width: myBanner.size.width.toDouble(),
                  height: myBanner.size.height.toDouble(),
                );
                return adContainer;
              },
            ),
            Expanded(
              child: Message(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
