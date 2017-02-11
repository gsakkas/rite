
let sqsum xs = let f a x = (+) x in let base = [] in List.fold_left f base xs;;
