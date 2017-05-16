
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 :: ((clone 0 ((List.length l1) - (List.length l2))) @ [l2])
  else
    if (List.length l1) < (List.length l2)
    then l2 :: ((clone 0 ((List.length l2) - (List.length l1))) @ [l1]);;
