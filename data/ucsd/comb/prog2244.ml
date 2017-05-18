
let pipe fs = let f a x a = a x in let base a = a in List.fold_left f base fs;;
