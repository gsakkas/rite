
let pipe fs = let f a x a = x in let base f = f in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
