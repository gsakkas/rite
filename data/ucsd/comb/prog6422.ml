
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (clone 0 (l1.length - l2.length) l2))
  else ((clone 0 (l2.length - l1.length)), l2);;
