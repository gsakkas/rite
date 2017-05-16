
let rec listReverse l = match l with | [] -> 0 | x::xl -> [listReverse xl];;
