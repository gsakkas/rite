
let app f l = List.fold_left (fun _  -> fun x  -> f x) () l;;

let _ = app (fun x  -> x) [1; 2; 4];;
