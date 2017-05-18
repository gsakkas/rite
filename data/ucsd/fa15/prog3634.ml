
let pipe fs = let f a x = a x in let base g p = p in List.fold_left f base fs;;
