
let bigMul l1 l2 =
  let f a x = match (a, x) with | ((b,c),d) -> d in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

let _ = bigMul [4; 0] [1; 0];;
