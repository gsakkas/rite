
let sqsum xs =
  let f a x = match x with | [] -> a | h::t -> h * h in
  let base = 0 in List.fold_left f base xs;;

let _ = sqsum [(-1); (-2); (-3); (-4)];;
