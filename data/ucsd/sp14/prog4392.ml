
let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x; (fun x  -> x * x))] 3;;
