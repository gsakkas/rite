
let rec wwhile (f,b) =
  match f with
  | (x,y) -> let (x,y) = f b in if y = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in if y = true then wwhile (f, x) else x;;

*)

(* changed spans
(3,2)-(4,69)
(3,8)-(3,9)
(4,13)-(4,69)
*)

(* type error slice
(3,2)-(4,69)
(3,8)-(3,9)
(4,25)-(4,26)
(4,25)-(4,28)
*)
