
let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = failwith "to be implemented" in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

let bigMul l1 l2 =
  let f a x =
    match (a, x) with | ((c,l),x) -> ((c * 10), (l + (bigMul (x * c) l1))) in
  let base = (1, l1) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;
