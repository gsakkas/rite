
let pipe fs = let f a x n = a in let base n = n in List.fold_left f base fs;;
