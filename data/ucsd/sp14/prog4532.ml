
let pipe fs = let f a x = fs a in let base = fs in List.fold_left f base fs;;
