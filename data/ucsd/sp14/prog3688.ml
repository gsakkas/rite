
let append x y = match y with | [] -> [] | h::t -> x :: h;;

let _ = append [1; 2] [3; 4];;
