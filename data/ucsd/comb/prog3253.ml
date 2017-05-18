
let pipe fs = let f a x y = y a in let base b = b in List.fold_left f base fs;;
