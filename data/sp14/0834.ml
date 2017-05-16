
let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = ((wwhile (fun xx  -> (xx, ((f xx) = xx)))), b);;


(* fix

let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = wwhile ((fun xx  -> (xx, ((f xx) = xx))), b);;

*)

(* changed spans
(8,21)-(8,67)
(8,30)-(8,62)
*)

(* type error slice
(2,3)-(6,9)
(2,16)-(6,7)
(8,22)-(8,63)
(8,23)-(8,29)
(8,30)-(8,62)
*)

(* all spans
(2,16)-(6,7)
(3,2)-(6,7)
(3,14)-(5,57)
(4,4)-(5,57)
(4,14)-(4,22)
(4,14)-(4,15)
(4,16)-(4,22)
(5,4)-(5,57)
(5,10)-(5,13)
(5,32)-(5,57)
(5,35)-(5,37)
(5,43)-(5,49)
(5,43)-(5,46)
(5,47)-(5,49)
(5,55)-(5,57)
(6,2)-(6,7)
(6,2)-(6,5)
(6,6)-(6,7)
(8,14)-(8,67)
(8,21)-(8,67)
(8,22)-(8,63)
(8,23)-(8,29)
(8,30)-(8,62)
(8,42)-(8,61)
(8,43)-(8,45)
(8,47)-(8,60)
(8,48)-(8,54)
(8,49)-(8,50)
(8,51)-(8,53)
(8,57)-(8,59)
(8,65)-(8,66)
*)
