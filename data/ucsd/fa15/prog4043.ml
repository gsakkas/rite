
let pipe fs = let f a x b = b x in let base b = b in List.fold_left f base fs;;
