
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let _ = append ([1; 2; 3], [4; 5; 6]);;
