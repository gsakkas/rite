
let rec listReverse l =
  let rec helper ls l =
    match l with
    | [] -> []
    | h::t -> if t = [] then h :: ls else helper (h :: ls) t in
  helper [] l;;

let lr = (listReverse lw lw) = lr;;
