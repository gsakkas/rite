
let pipe fs = let f a x = fs a x in let base = [] in List.fold_left f base fs;;
