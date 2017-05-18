
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) :: l2))
      else (((clone 0 (dl / (-1))) :: l1), l2);;

let _ = padZero [1; 0; 0; 2] [9; 9];;
