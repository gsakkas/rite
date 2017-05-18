
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> (f hd hd) + (f tl tl) in
  List.fold_left f base xs;;
