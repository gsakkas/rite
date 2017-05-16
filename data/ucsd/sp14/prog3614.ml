
let pipe fs = let f a x = fs x in let base = 3 in List.fold_left f base fs;;
