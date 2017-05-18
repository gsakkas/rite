
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then ((l1 :: (clone 0 difference2)), l2)
  else
    if difference1 > 0 then (l1, (l2 :: (clone 0 difference1))) else (l1, l2);;
