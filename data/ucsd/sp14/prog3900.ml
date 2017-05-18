
let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

let _ = sqsum [1.0; 4.0];;
