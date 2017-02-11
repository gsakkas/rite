
let sqsum xs =
  let f a x = match x with | [] -> 0 | h::t -> a + h in
  let base = 0 in List.fold_left f base xs;;

let _ = sqsum [(-1); (-2); (-3); (-4)];;
