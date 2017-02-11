
let sqsum xs =
  let f a x f _ = a * a in let base = 0 in List.fold_left f base xs;;
