
let pipe fs =
  let f a x = (fun result  -> fun x  -> a + x) 0 in
  let base = 1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,46)
(3,14)-(3,48)
(3,30)-(3,45)
(3,40)-(3,41)
(3,40)-(3,45)
(3,47)-(3,48)
(4,2)-(4,42)
(4,13)-(4,14)
*)

(* type error slice
(3,2)-(4,42)
(3,8)-(3,48)
(3,10)-(3,48)
(3,14)-(3,46)
(3,14)-(3,48)
(3,30)-(3,45)
(3,40)-(3,41)
(3,40)-(3,45)
(4,18)-(4,32)
(4,18)-(4,42)
(4,33)-(4,34)
*)
