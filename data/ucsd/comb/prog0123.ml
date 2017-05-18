
let rec myFunc f a b = match b with | [] -> a | h::t -> myFunc f (f a h) t;;

let _ = myFunc (fun x  -> fun y  -> x y) (fun x  -> x) [1; 2; 3];;
