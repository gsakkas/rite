
let sqsum xs =
  let f a x x = (x * x) + a in let base = [] in List.fold_left f base xs;;
