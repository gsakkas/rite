
let bigMul l1 l2 =
  let f a x = x in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

let _ = bigMul [9; 9; 9; 9; 9] [9; 9; 9; 9; 9];;
