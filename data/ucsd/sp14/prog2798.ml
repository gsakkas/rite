
let pipe fs = let f a x l = x a in let base p = p in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 4)] 3;;
