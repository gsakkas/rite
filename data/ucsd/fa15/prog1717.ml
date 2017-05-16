
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) :: l2))
  else (let z = y - x in (((clone 0 z) :: l1), l2));;

let _ = padZero [9; 9] [1; 0; 0; 2];;
