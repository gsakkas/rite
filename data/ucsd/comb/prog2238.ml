
let pipe fs = let f a x = a x in let base q = q in List.fold_left f base fs;;
