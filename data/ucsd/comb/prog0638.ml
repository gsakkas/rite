
let pipe fs = let f a x z = z a in let base y = y in List.fold_left f base fs;;
