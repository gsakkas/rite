
let sqsum xs =
  let f a x = match x with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = f 0 xs in List.fold_left f base xs;;
