(* `bigMul xs ys` should perform long multiplication on `xs` and `ys`.
    For example `bigMul [9;9;9;9] [9;9;9;9] = [9;9;9;8;0;0;0;1]` *)

let bigMul l1 l2 =
  let f acc el = el in
  let base = (0, []) in
  let args = l1 in
  let (_,res) = List.fold_left f base args in
    res

let _ = bigMul [9] [9]
