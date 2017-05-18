
let pipe fs = let f a x _ = a in let base y = y in List.fold_left f base fs;;
