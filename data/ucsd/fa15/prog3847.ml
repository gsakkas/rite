
let pipe fs n = let f a x = a n in let base = n in List.fold_left f base fs;;
