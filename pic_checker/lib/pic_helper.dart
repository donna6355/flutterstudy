import 'dart:io';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import './color_similarity.dart';
import './color_model.dart';

enum EmartColor {
  eYellow([255, 184, 28], 28),
  eBrown([108, 100, 99], 20),
  eRed([194, 0, 36], 20);

  final List<int> rgb;
  final int similarity;
  const EmartColor(this.rgb, this.similarity);
}

class PictureHelper {
  PictureHelper._();

  static Future<List<ColorModel>> pickAndCompareColor(
      File img, int bagType) async {
    List<ColorModel> res = [];
    PaletteGenerator freqColors = await PaletteGenerator.fromImageProvider(
      FileImage(img),
      maximumColorCount: 5,
    );
    EmartColor bag = bagType == 2
        ? EmartColor.eYellow
        : bagType == 4
            ? EmartColor.eRed
            : EmartColor.eBrown;
    for (var element in freqColors.paletteColors) {
      var col = element.color;
      final double similar =
          Similarity.deltaE(bag.rgb, [col.red, col.green, col.blue]);
      res.add(ColorModel(
          res:
              '색깔 = $col [R:${col.red}, G:${col.green}, B:${col.blue}] \n 유사도 = ${similar.toInt()}, ${similar < bag.similarity ? '유사색' : '다른색'}',
          color: col));
    }
    return res;
  }
}
