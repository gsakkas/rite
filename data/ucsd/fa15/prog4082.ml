
let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = [] in
  let args = List.rev l2 in
  let (carry,res) = List.fold_left f base args in [carry] @ res;;
