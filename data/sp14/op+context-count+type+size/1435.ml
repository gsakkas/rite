
let rec wwhile (f,b) =
  match f with
  | (x,y) -> let (x,y) = f b in if y = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in if y = true then wwhile (f, x) else x;;

*)

(* changed spans
(3,3)-(4,70)
(3,9)-(3,10)
(4,14)-(4,70)
*)

(* type error slice
(3,3)-(4,70)
(3,9)-(3,10)
(4,26)-(4,27)
(4,26)-(4,29)
*)
