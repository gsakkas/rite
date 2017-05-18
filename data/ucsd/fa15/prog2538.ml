
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then ((clone 0 ((List.length l2) - (List.length l1))), l2)
    else (l1, (clone 0 ((List.length l1) - (List.length l2))));;

let _ = padZero [9; 9] [1; 0; 0; 2];;
