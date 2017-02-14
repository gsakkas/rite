
let (x,y) = ("5", 5);;

let rec wwhile (f,b) =
  let f b = (x, y) in if y = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let (a',b') = f b in if b' = true then wwhile (f, b') else a';;

*)

(* changed spans
(2,12)-(2,20)
(2,13)-(2,16)
(2,18)-(2,19)
(5,2)-(5,59)
(5,8)-(5,18)
(5,12)-(5,18)
(5,13)-(5,14)
(5,16)-(5,17)
(5,22)-(5,59)
(5,25)-(5,26)
(5,58)-(5,59)
*)

(* type error slice
(2,3)-(2,22)
(2,12)-(2,20)
(2,18)-(2,19)
(5,25)-(5,26)
(5,25)-(5,33)
(5,25)-(5,33)
(5,29)-(5,33)
*)
