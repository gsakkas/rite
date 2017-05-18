
let pipe fs = let f a x = a x in let base f a = a in List.fold_left f base fs;;
