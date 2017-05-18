
let sqsum xs =
  let f a x = a ** 2 in let base = f 2 xs in List.fold_left f base xs;;
