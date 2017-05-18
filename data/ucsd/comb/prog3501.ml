
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let one = [9; 9];;

let two = clone 0 2;;

let three = two :: one;;
