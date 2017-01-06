
let sqsum xs =
  let f a x = match x with | hd::tl -> hd * hd in
  let base = f 4 xs in List.fold_left f base xs;;



let sqsum xs =
  let f a x = a * a in let base = f 4 xs in List.fold_left f base xs;;


(* changed spans
(3,15)-(3,42)
(3,45)-(3,47)
*)

(* type error slice
(4,24)-(4,48)
*)
