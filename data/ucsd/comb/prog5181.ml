
let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

let _ = List.map (sqsum, [1; 2; 3; 4; 4]);;
