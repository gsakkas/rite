
let sqsum xs =
  let f a x a x = a + (x * x) in let base = xs in List.fold_left f base xs;;
