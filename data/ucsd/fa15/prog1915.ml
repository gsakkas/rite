
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then let n = (List.length l2) - (List.length l1) in clone (0 n)
  else
    if (List.length l2) < (List.length l1)
    then (let n = (List.length l1) - (List.length l2) in clone (0 n))
    else (l1, l2);;
