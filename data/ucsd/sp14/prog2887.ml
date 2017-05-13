
let sqsum xs = let f a x = a * a in let base = [] in List.fold_left f base xs;;
