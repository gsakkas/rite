
let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper t l2);;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (carry,res) = a in
    ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
  let base = (0, []) in
  let args = List.rev (helper l1 l2) in
  let (carry,res) = List.fold_left f base args in res;;

let _ = bigMul [9; 9; 9; 9; 9] [9; 9; 9; 9; 9];;
