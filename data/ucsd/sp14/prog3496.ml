
let pipe fs = let f a x = a x in let base j y = y in List.fold_left f base fs;;
