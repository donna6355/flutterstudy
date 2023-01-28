// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

// An input string is valid if:

// Open brackets must be closed by the same type of brackets.
// Open brackets must be closed in the correct order.
// Every close bracket has a corresponding open bracket of the same type.

class Solution {
  bool isValid(String s) {
    //declare String following ='';
    //if opeing brace is coming set close
    //if closing brace is coming set empty string
    //check if coming charater equals to following;
    //possible to open several braces consecutively....
    // final Map<String, String?> standard = {
    //   '(': ')',
    //   ')': null,
    //   '[': ']',
    //   ']': null,
    //   '{': '}',
    //   '}': null,
    // };

    // String following = '';
    // for (var i = 0; i < s.length; i++) {
    //   if (following.isEmpty) {
    //     if (standard[s[i]] != null) {
    //       following = standard[s[i]]!;
    //     } else {
    //       return false;
    //     }
    //   } else {
    //     if (s[i] == following) {
    //       following = '';
    //     } else {
    //       return false;
    //     }
    //   }
    // }
    // return true;

//"{[]}" true
//"([)]" false
    // final List<int> checkList = [0, 0, 0]; //parenthesis, curly brace, bracket
    // for (var i = 0; i < s.length; i++) {
    //   bool stop = false;
    //   switch (s[i]) {
    //     case '(':
    //       checkList[0] += 1;
    //       break;
    //     case ')':
    //       if (checkList[0] > 0) {
    //         checkList[0] -= 1;
    //       } else {
    //         stop = true;
    //       }
    //       break;
    //     case '{':
    //       checkList[1] += 1;
    //       break;
    //     case '}':
    //       if (checkList[1] > 0) {
    //         checkList[1] -= 1;
    //       } else {
    //         stop = true;
    //       }
    //       break;
    //     case '[':
    //       checkList[2] += 1;
    //       break;
    //     case ']':
    //       if (checkList[2] > 0) {
    //         checkList[2] -= 1;
    //       } else {
    //         stop = true;
    //       }
    //       break;
    //     default:
    //       break;
    //   }
    //   if (stop) return false;
    // }

    // return checkList.reduce((a, b) => a + b) > 0 ? false : true;
//open brace is always allowed
//close brace has to be correct order
//timeout
    if (s.length.isOdd) return false;
    final List<String> closing = [];
    for (var i = 0; i < s.length; i++) {
      bool stop = false;
      switch (s[i]) {
        case '(':
          closing.add(')');
          break;
        case '[':
          closing.add(']');
          break;
        case '{':
          closing.add('}');
          break;
        case ')':
        case ']':
        case '}':
          if (closing.isEmpty) {
            stop = true;
            break;
          }
          closing.last == s[i] ? closing.removeLast() : stop = true;
          break;
        default:
      }
      if (stop) return false;
    }
    return closing.isEmpty ? true : false;
  }

  bool isValidWork(String s) {
    String d1 = "()";
    String d2 = "{}";
    String d3 = "[]";
    while (s.isNotEmpty) {
      if (s.contains(d1)) {
        s = s.replaceAll(d1, '');
      } else if (s.contains(d2)) {
        s = s.replaceAll(d2, '');
      } else if (s.contains(d3)) {
        s = s.replaceAll(d3, '');
      } else {
        return false;
      }
    }
    return true;
  }
}
