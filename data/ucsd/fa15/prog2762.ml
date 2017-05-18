
let pipe fs = let f a x = fs in let base = 0 in List.fold_left f base fs;;
