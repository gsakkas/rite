
let sqsum xs =
  let f a x = (a ^ 2.) :: x in let base = 0 in List.fold_left f base xs;;
