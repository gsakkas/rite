
let pipe fs = let f a x = a x in let base b = b in List.fold_left f base fs;;
