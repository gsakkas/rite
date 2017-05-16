
let pipe fs = let f a x x = x a in let base y = y in List.fold_left f base fs;;
