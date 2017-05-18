
let sqsum xs =
  let f a x x = x * x in let base a x = a + x in List.fold_left f base xs;;
