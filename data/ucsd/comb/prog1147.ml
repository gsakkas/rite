
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> [] | x::xs' -> f x xs' in
  List.fold_left f base xs;;
