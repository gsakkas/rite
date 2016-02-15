let bigMul l1 l2 =
  let f acc el = el in
  let base = (0, []) in
  let args = l1 in
  let (_,res) = List.fold_left f base args in
    res

let _ = bigMul [9] [9]
