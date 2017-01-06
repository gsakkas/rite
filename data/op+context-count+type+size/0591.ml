
let sqsum xs = let f a x = a * a in let base = [] in List.fold_left f base xs;;



let sqsum xs =
  let f a x = a * a in let base = f 2 xs in List.fold_left f base xs;;


(* changed spans
(2,48)-(2,50)
*)

(* type error slice
(2,54)-(2,78)
*)
