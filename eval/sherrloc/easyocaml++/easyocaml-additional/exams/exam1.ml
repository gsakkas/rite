(*F*)
let average weight li =
  let iterator (sum, length) x = sum + weight x, length + 1 in
  let sum, length = List.fold_left iterator (0, 0) li in
  sum / length

let find_best weight lis =
  let average = average weight in
  let iterator (best, max) li =
    let avg_list = average li in
    if avg_list > max
    then li, avg_list
    else best, max in
  let best, _ = List.fold_left iterator ([], 0) lis in
  best

let find_best_simple lis = find_best 1 lis
