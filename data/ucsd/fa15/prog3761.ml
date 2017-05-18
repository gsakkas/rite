
let f a x = (a * a) + x;;

let pipe fs = let f a x = f x a in let base = 0 in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
