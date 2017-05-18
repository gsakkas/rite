
let foo xs = match xs with | [] -> (fun x  -> x) | h::t -> h;;

let _ = foo [1; 2; 3; 4; 5] [1; 0; 1; 0];;
