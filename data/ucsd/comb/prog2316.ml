
let sqsum xs =
  let f a x = match x with | [] -> 0 | h::t -> 1 in
  let base = 0 in List.fold_left f base xs;;

let sqsum xs =
  let f a x = match x with | [] -> a | h::t -> (h * h) + (sqsum t) in
  let base = 0 in List.fold_left f base xs;;
