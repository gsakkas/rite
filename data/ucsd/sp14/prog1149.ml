
let sqsum xs =
  let f a x = a + (x * x) in let base = f 4 xs in List.fold_left f base xs;;
