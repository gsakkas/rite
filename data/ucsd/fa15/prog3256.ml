
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then clone l1 ((List.length l2) - (List.length l1))
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;
