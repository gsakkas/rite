
let sqsum xs =
  let f a x mb x = (x * x) + a in let base = 0 in List.fold_left f base xs;;
