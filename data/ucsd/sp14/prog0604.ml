
let append x l = match l with | [] -> [x] | h::t -> x :: h :: t;;

let _ = append [0] [1; 2];;
