
let pipe fs = let f a x y = x a in let base y = y in List.fold_left f base fs;;

let fn = pipe [(fun x  -> x + x)];;
