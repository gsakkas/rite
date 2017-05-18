
let pipe fs = let f a x = x a in let base y = y in List.fold_left f base fs;;

let _ = pipe [(fun x  -> 2)] 4;;
