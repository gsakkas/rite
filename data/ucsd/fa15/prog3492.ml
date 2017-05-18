
let pipe fs = let f a x = x a in List.fold_left f (fun x  -> x) fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
