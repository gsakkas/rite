
let sqsum xs =
  let f a x = (+) in let base = 3 ** 2 in List.fold_left f base xs;;
