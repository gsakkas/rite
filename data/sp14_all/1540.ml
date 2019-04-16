
let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = f 4 xs in List.fold_left f base xs;;

*)

(* changed spans
(4,14)-(4,16)
f 4 xs
AppG (fromList [VarG,LitG])

*)

(* type error slice
(3,3)-(4,44)
(3,9)-(3,64)
(3,51)-(3,52)
(3,51)-(3,64)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
(4,37)-(4,41)
*)
