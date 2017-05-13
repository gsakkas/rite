
let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = (1, []) in
  let args = ((List.rev l2), l1) in
  let (_,res) = List.fold_left f base args in res;;
