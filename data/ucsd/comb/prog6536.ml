
let sqsum xs = let f a x = a * a in let base = f in List.fold_left f base xs;;
