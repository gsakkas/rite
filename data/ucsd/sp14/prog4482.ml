
let pipe fs = let f a x a = a x in let base x = x in List.fold_left f base fs;;
