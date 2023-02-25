// Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

// The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the
// frequency
//  of at least one of the chosen numbers is different.

// The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {}
}

// var combinationSum = function(candidates, target) {

//     // No candidates, means no results
//     if (!candidates) {
//         return [];
//     }

//     // Empty set is the only solution for target 0
//     if (target === 0) {
//         return [[]];
//     }

//     // Sort the candidates array as otherwise we could
//     // come up with solution [3,2,2] instead of [2,2,3]
//     candidates.sort((a,b) => { return a - b});

//     // Store all possible combinations in here
//     let paths = [];

//     // The recursive part.
//     // t is what we're looking for. This will become smaller, deeper in to the recursive calls
//     // p is where we will record our current path
//     // i is the index of the numbers we're considering. Once we get stuck with the 2's
//     // we will increase i to try other combinations

//     let find = function (t, p, i) {

//         // check std out to  get a feel for the order in which we encounter 2,3,6,7
//         console.log('considering:', t , p, i);

//         if (t === 0) {
//             // we found a valid path, so store that in the paths.
//             paths.push(p);
//             return;
//         } else if (t < 0) {
//             console.log('Dead path. Will our code actually ever get here?');
//             return;
//         } else {
//             // don't run over the candidates array length
//             // && don't try candidates that would bring target below 0
//             while (i < candidates.length && t - candidates[i] >= 0) {

//                 // "Use" candidate[i]: Lower our target, and record the candidate in the path
//                 // We're cloning the path array, or it will contaminate future paths.
//                 find(t - candidates[i], [...p, candidates[i]], i)

//                 // "Lose" candidate[i]:
//                 // In our main example, we don't hit this path until the path of pure 2's
//                 // has been tried and found to lead to [2,2,2] with no candidates worth pursuing                 // further, because of the 2nd check of the while loop condition.
//                 i++;
//             }

//         }

//     }

//     // kick off initial case, we're looking for the original target,
//     // our current path is empty, and we'll consider all candidates
//     find (target, [], 0);

//     return paths;
// };
