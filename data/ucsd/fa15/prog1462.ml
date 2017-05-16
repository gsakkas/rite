
let sqsum xs = let f a x = x * x in let base = 0 in List.fold_right f base xs;;
