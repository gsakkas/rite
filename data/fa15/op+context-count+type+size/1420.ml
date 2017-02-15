
let f' (f,b) = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((f' (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(2,15)-(2,20)
(2,15)-(2,24)
(2,16)-(2,17)
(2,18)-(2,19)
(2,23)-(2,24)
(4,16)-(5,63)
(5,41)-(5,47)
(7,14)-(7,44)
*)

(* type error slice
(2,3)-(2,26)
(2,8)-(2,24)
(2,15)-(2,24)
(5,8)-(5,9)
(5,8)-(5,11)
(5,41)-(5,47)
(5,41)-(5,55)
(5,48)-(5,55)
(5,49)-(5,50)
(7,21)-(7,27)
(7,21)-(7,44)
(7,28)-(7,44)
(7,29)-(7,40)
(7,30)-(7,32)
*)
