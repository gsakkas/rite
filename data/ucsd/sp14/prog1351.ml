
let sqsum xs =
  let f a x = x ** 2.0 in let base = 0.0 in List.fold_left f base xs;;

let _ = sqsum [1; 2; 3; 4];;
