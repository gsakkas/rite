
let f a x = a * a;;

let sqsum xs =
  let f a x = (a * a) + (f List.hd xs x) in
  let base = 0 in List.fold_left f base xs;;
