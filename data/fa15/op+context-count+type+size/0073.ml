
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile ((f b), x) | (x,y) -> x;;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

*)

(* changed spans
(4,50)-(4,55)
(4,53)-(4,54)
*)

(* type error slice
(2,3)-(4,74)
(2,16)-(4,72)
(4,42)-(4,48)
(4,42)-(4,59)
(4,49)-(4,59)
(4,50)-(4,55)
(4,51)-(4,52)
*)
