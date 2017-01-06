
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> [] | x::xs' -> f x xs' in
  List.fold_left f base xs;;



let sqsum xs =
  let f a x = a * a in let base = f 2 xs in List.fold_left f base xs;;


(* changed spans
(4,14)-(4,50)
(4,53)-(4,58)
*)

(* type error slice
(3,3)-(5,27)
(4,14)-(4,58)
(4,51)-(4,58)
*)
