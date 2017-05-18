
let pipe fs = let f a x = 3 + a in let base y = y in List.fold_left f base fs;;
