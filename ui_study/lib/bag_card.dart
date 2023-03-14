import 'package:flutter/material.dart';

class BagCard extends StatelessWidget {
  const BagCard(this.qty, this.isSmall, {super.key});
  final int qty;
  final bool isSmall;

  String _wonFormat() {
    String total = (qty * (isSmall ? 500 : 3000)).toString();
    final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return total.replaceAllMapped(reg, (match) => '${match[1]},');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: 157,
            height: 157,
            color: Colors.red,
            child: Center(child: Image.asset('TODO')),
          ),
        ),
        BrownText(label: isSmall ? 'S' : 'L'),
        BrownText(label: 'size', isLightColor: true),
        const Spacer(),
        Text('$qty 개'),
        SizedBox(
          width: 197,
          child: Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: BrownText(label: '${_wonFormat()}원'),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class BrownText extends StatelessWidget {
  const BrownText({required this.label, this.isLightColor = false, super.key});
  final bool isLightColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: isLightColor
          ? TextStyle(
              // color:
              fontSize: 36,
              fontWeight: FontWeight.bold,
              height: 1.5,
            )
          : TextStyle(
              // color:
              fontSize: 36,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
    );
  }
}

class YellowHeader extends StatelessWidget {
  const YellowHeader(this.label, {super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        // color: CommonStyle.emartYellow
        fontSize: 48,
        fontWeight: FontWeight.bold,
        height: 1.5,
      ),
    );
  }
}


static const String checkBag = '장바구니를 확인하고 있습니다.';
static const String processBag = '반납중입니다.\n잠시만 기다려주세요.';
static const String invalidBarcode ='유효 하지않은 바코드입니다.';
static const String invalidBag ='반납이 불가능한 장바구니 입니다.\n장바구니를 꺼내주세요.';
static const String returnedQty = '4/10 개가 반납되었습니다.';
static const String boxFull ='적재함이 가득차 추가 반납이 불가능 합니다.';
static const String refundBag = '보증금 환불을 진행합니다.';
static const String returnMore = '추가 반납하시겠습니까?';
static const String refundDone = '보증금 환불이 완료되었습니다.\n이용해주셔서 감사합니다.';
static const String timeOver ='대기시간이 초과되었습니다.\n홈 화면으로 이동합니다.';
static const String plzWait ='잠시만 기다려주세요.';
static const String dispenseMoney ='현금이 나오고 있습니다.';
static const String homeAlert ='홈 화면으로 이동하면 환불 절차가 중단됩니다.\n이동하시겠습니까?';
static const String bagNeverReturn ='이미 반납된 장바구니는 반환되지 않습니다.';
static const String dispenseError='현금 방출 도중 장애가 발생했습니다.\n직원에게 문의해주세요.';
static const String extendTime ='대기 시간 연장';
static const String backHome ='홈 화면으로 이동';
static const String confirm ='확인';
static const String yesReturnMore ='네 (이어서 반납)';
static const String noToNext ='아니오 (다음 단계로)';
static const String yesToHome ='네 (홈 화면으로 이동)';
static const String noToPrev ='아니오 (이전 화면으로)';
static const String errorNoCoin ='현금 (동전) 부족';
static const String errorNoBill ='현금 (지폐) 부족';
static const String errorFull ='적재함 가득참';
static const String errorNetwork ='네트워크 에러';