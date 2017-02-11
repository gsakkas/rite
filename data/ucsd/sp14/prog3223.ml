
let pipe fs = let f a x = x a in let base y = y in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
