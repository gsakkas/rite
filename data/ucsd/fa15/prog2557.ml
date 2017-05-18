
let sqsum xs =
  let f a x = match x with | [] -> a | x::t -> x * x in
  let base = [] in List.fold_left f base xs;;
