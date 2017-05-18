
let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

let _ = pipe [(fun x  -> fun y  -> y + x); (fun x  -> fun y  -> x + y)] 3;;
