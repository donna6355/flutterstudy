import 'dart:math';

class Similarity {
  Similarity._();
  static double deltaE(rgbA, rgbB) {
    List<num> labA = rgb2lab(rgbA);
    List<num> labB = rgb2lab(rgbB);
    num deltaL = labA[0] - labB[0];
    num deltaA = labA[1] - labB[1];
    num deltaB = labA[2] - labB[2];
    double c1 = sqrt(labA[1] * labA[1] + labA[2] * labA[2]);
    double c2 = sqrt(labB[1] * labB[1] + labB[2] * labB[2]);
    double deltaC = c1 - c2;
    double deltaH = deltaA * deltaA + deltaB * deltaB - deltaC * deltaC;
    deltaH = deltaH < 0 ? 0 : sqrt(deltaH);
    double sc = 1.0 + 0.045 * c1;
    double sh = 1.0 + 0.015 * c1;
    double deltaLKlsl = deltaL / (1.0);
    double deltaCkcsc = deltaC / (sc);
    double deltaHkhsh = deltaH / (sh);
    double i = deltaLKlsl * deltaLKlsl +
        deltaCkcsc * deltaCkcsc +
        deltaHkhsh * deltaHkhsh;
    return i < 0 ? 0 : sqrt(i);
  }

  static List<num> rgb2lab(rgb) {
    num r = rgb[0] / 255, g = rgb[1] / 255, b = rgb[2] / 255, x, y, z;
    r = (r > 0.04045) ? pow((r + 0.055) / 1.055, 2.4) : r / 12.92;
    g = (g > 0.04045) ? pow((g + 0.055) / 1.055, 2.4) : g / 12.92;
    b = (b > 0.04045) ? pow((b + 0.055) / 1.055, 2.4) : b / 12.92;
    x = (r * 0.4124 + g * 0.3576 + b * 0.1805) / 0.95047;
    y = (r * 0.2126 + g * 0.7152 + b * 0.0722) / 1.00000;
    z = (r * 0.0193 + g * 0.1192 + b * 0.9505) / 1.08883;
    x = (x > 0.008856) ? pow(x, 1 / 3) : (7.787 * x) + 16 / 116;
    y = (y > 0.008856) ? pow(y, 1 / 3) : (7.787 * y) + 16 / 116;
    z = (z > 0.008856) ? pow(z, 1 / 3) : (7.787 * z) + 16 / 116;
    return [(116 * y) - 16, 500 * (x - y), 200 * (y - z)];
  }
}
// deltaE([128, 0, 255], [128, 0, 255]); // 0
// deltaE([128, 0, 255], [128, 0, 230]); // 3.175
// deltaE([128, 0, 255], [128, 0, 230]); // 21.434
// deltaE([0, 0, 255], [255, 0, 0]); // 61.24

//landers red 194, 0, 36
//emart yellow 255,184,28
//emart copper 108, 100, 99