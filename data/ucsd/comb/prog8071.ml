
let pipe fs = let f a x = fs x in let base = f in List.fold_left f base fs;;
