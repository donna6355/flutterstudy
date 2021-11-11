import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../widget/drawer_profile.dart';
import '../widget/profile_card.dart';
import '../model/profile.dart';

class LivingRoom extends StatelessWidget {
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-5356942048071979/5909864936',
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
      drawer: DrawerProfile(),
      appBar: AppBar(
        elevation: 0,
        title: Text('집사 일기'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/profile_edit');
            },
            child: Text('냥줍'),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<Box>(
                  valueListenable: Hive.box('myCats').listenable(),
                  builder: (context, box, widget) {
                    // final List keys = box.keys.toList();
                    if (box.length == 0)
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // color: Colors.white,
                            ),
                            margin: EdgeInsets.fromLTRB(50, 70, 50, 20),
                            child: Image.asset('asset/img/pickme.png'),
                          ),
                          Text(
                            '너 오늘부터 내 집사해라옹!',
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/profile_edit');
                            },
                            child: Text('주인님 프로필 작성하기'),
                          )
                        ],
                      );
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: box.length,
                        itemBuilder: (BuildContext ctx, idx) {
                          final Profile profile = box.getAt(idx);
                          return ProfileCard(profile);
                        });
                  }),
            ),
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
          ],
        ),
      ),
    );
  }
}
