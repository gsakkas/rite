
let sqsum xs =
  let f a x = let a::xs = xs in a * a in
  let base = 0 in List.fold_left f base xs;;

let sqsum xs =
  let f a x = let a::x = x in (a * a) + (sqsum x) in
  let base = 0 in List.fold_left f base xs;;

let _ = sqsum [(-1); (-2); (-3); (-4)];;
