
let f a x = a * a;;

let sqsum xs =
  let f a x = (a * a) + (f a) in let base = x in List.fold_left f base xs;;
