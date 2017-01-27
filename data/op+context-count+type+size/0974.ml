
let (x,y) = ("5", 5);;

let rec wwhile (f,b) =
  let f b = (x, y) in if x = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let (a',b') = f b in if b' = true then wwhile (f, b') else a';;

*)

(* changed spans
(2,14)-(2,17)
(2,14)-(2,20)
(2,19)-(2,20)
(5,9)-(5,18)
(5,14)-(5,15)
(5,14)-(5,18)
(5,17)-(5,18)
(5,23)-(5,60)
(5,26)-(5,27)
(5,59)-(5,60)
*)

(* type error slice
(2,4)-(2,23)
(2,14)-(2,17)
(2,14)-(2,20)
(2,19)-(2,20)
(5,26)-(5,27)
(5,26)-(5,34)
(5,30)-(5,34)
*)
