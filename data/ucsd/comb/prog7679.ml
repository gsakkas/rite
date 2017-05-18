
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = failwith "to be implemented" in
  let args =
    ((padZero l1 l2),
      (if (List.length l1) >= (List.length l2) then l1 else l2)) in
  let (_,res) = List.fold_left f base args in res;;
