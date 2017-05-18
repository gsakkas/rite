
let sqsum xs =
  let f a x = x * x in let base = [] in List.fold_right f base xs;;

let _ = sqsum [];;
