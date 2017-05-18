
let pipe fs = let f a x = x a in let base a' = a' in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 7); (fun x  -> x + x); (fun x  -> x * x)] 3;;
