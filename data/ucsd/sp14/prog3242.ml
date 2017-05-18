
let pipe fs = let f a x = 0 in let base = fs in List.fold_left f base fs;;
