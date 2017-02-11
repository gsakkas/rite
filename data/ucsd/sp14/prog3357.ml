
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append clone 0 ((List.length l1) - (List.length l2))), l2)
  else
    if (List.length l1) < (List.length l2)
    then
      ((List.append (clone 0 ((List.length l2) - (List.length l1)) l1)), l2)
    else (l1, l2);;
