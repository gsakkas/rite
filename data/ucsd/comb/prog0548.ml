
let rec backCons xs x = match xs with | [] -> x | y::ys -> y :: x;;

let _ = backCons [1; 2] 3;;
