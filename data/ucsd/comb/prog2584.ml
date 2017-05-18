
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2) padZero
      [9; 9] [8; 8; 8];;
