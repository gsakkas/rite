
let pipe fs = let f a x x = x a in let base n = n in List.fold_left f base fs;;
