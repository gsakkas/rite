
let sqsum xs =
  let f a x a x = a + (x * x) in
  let base = "string" in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,24)-(3,29)
(3,28)-(3,29)
(4,14)-(4,22)
(4,41)-(4,42)
(4,43)-(4,47)
(4,48)-(4,50)
*)

(* type error slice
(3,3)-(4,50)
(3,9)-(3,29)
(3,11)-(3,29)
(3,13)-(3,29)
(4,3)-(4,50)
(4,14)-(4,22)
(4,26)-(4,40)
(4,26)-(4,50)
(4,41)-(4,42)
(4,43)-(4,47)
*)
