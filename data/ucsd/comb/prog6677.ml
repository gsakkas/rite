
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let l1 = [(9, 9)];;

let l2 = [(9, 9, 9, 9, 9)];;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

let _ = let (b,a) = padZero l1 l2 in List.combine b a;;
