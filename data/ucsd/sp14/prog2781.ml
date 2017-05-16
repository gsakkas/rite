
let pipe fs = let f a x x = a in let base p = p in List.fold_left f base fs;;
