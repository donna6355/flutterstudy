// Design an algorithm to encode a list of strings to a string. The encoded string is then sent over the network and is decoded back to the original list of strings.

// Please implement encode and decode

class Solution {
  //set delimiter which is non-ascii

  String encodeString(List<String> strs) {
    const divider = '€';
    return strs.join(divider);
  }

  List<String> decodeStrings(String str) {
    const divider = '€';
    return str.split(divider);
  }
}
