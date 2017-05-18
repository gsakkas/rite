
let pipe fs = let f a x = x in let base = fs in List.fold_left f base fs;;
