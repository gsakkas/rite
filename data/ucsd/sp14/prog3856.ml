
let pipe fs = let f a x l x = a in let base x = x in List.fold_left f base fs;;
