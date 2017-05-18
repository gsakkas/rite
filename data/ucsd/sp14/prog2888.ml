
let sqsum xs =
  let rec f a x = match xs with | [] -> a | hd::tl -> f (f a hd) tl in
  let base = 0 in List.fold_left f base xs;;
