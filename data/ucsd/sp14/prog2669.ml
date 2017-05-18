
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) :: l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) :: l1), l2);;

let _ = padZero [9; 9] [1; 0; 0; 2];;
