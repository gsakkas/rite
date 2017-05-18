
let pipe fs = let f a x x = a in let base q = q in List.fold_left f base fs;;
