
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  let sizDif = length1 - length2 in
  if sizDif > 0
  then l1 :: (clone 0 sizDif) :: l2
  else ((clone 0 (- sizDif)) :: l1) :: l2;;
