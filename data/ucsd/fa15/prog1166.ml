
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (padZero (clone 0 1)) @ (l1 l2)
  else
    if (List.length l1) > (List.length l2)
    then (padZero l1 (clone 0 1)) @ l2
    else (l1, l2);;
