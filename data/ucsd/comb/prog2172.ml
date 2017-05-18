
let sqsum xs =
  let f a x = (a * a) + x in let base = [] in List.fold_left f base xs;;
