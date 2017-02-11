
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let (i,j) = x in
    let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args = List.combine (List.rev (0 :: l)) (clone i ((List.length l) + 1)) in
  let (_,res) = List.fold_left f base args in res;;

let bigMul l1 l2 =
  let f a x =
    let (i,j) = a in
    let multiplier m n =
      (((List.length l1) - 1), ((mulByDigit (x * (int_of_float (m ** i))) l2)
        :: n)) in
    multiplier (float_of_int i) j in
  let base = (0, []) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;
