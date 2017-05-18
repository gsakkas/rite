
let pipe fs = let f a x = a x in let base b x = x in List.fold_left f base fs;;
