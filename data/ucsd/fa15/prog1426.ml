
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone (0, (ll1 - ll2))) @ l2))
  else (((clone (0, (ll2 - ll1))) @ l1), l2);;
