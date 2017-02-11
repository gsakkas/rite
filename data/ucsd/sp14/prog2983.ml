
let sqsum xs =
  let f a x = match x with | hd::tl -> hd * hd in
  let base = f 4 xs in List.fold_left f base xs;;
