
let rec listReverse l = match l with | [] -> l | h::t -> [listReverse t; h];;
