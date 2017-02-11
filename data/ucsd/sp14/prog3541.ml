
let sqsum xs =
  let f a x a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;
