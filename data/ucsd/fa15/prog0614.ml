
let pipe fs = let f a x = x in let base y = y in List.fold_right f base fs;;
