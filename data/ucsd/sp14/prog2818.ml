
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 = (((clone 0 2) :: l1), l2);;

let _ = padZero [9; 9] [1; 0; 0; 2];;
