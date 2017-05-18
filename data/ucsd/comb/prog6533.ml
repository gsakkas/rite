
let f a x = a * a;;

let sqsum xs =
  let f a x = let aa = a * a in aa + f in
  let base = List.hd xs in List.fold_left f base xs;;
