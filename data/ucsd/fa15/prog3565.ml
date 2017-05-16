
let sqsum xs =
  let f a x a x = a + (x * x) in
  let base base = base in List.fold_left f base xs;;
