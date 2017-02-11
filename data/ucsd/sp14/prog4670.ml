
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let x = padZero [9; 9] [1; 0; 0; 2];;

let y = match x with | (s,i) -> s;;

let z = match x with | (s,i) -> i;;

let o = List.combine y z;;

let p = match o with | h::h2::t::(s,i) -> s + i;;
