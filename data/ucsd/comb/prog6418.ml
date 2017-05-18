
let sqsum xs =
  let f a x = a + (x * x) in let base x = x in List.fold_left f base xs;;
