
let sqsum xs =
  let f a x = match x with | [] -> 0 | x::xs' -> x * x in
  let base = List.hd xs in List.fold_left f base xs;;
