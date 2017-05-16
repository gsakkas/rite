
let pipe fs = let f a x = a fs in let base = [] in List.fold_left f base fs;;
