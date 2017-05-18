
let rec append l r = match l with | [] -> r | h::t -> h :: (t append r);;
