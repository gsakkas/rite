
let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = wwhile (fun xx  -> ((xx, ((f xx) = xx)), b));;


(* fix

let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = wwhile ((fun xx  -> (xx, ((f xx) = xx))), b);;

*)

(* changed spans
(8,28)-(8,65)
(8,41)-(8,60)
*)

(* type error slice
(2,3)-(6,9)
(2,16)-(6,7)
(8,21)-(8,27)
(8,21)-(8,65)
(8,28)-(8,65)
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
(8,14)-(8,65)
(8,21)-(8,65)
(8,21)-(8,27)
(8,28)-(8,65)
(8,40)-(8,64)
(8,41)-(8,60)
(8,42)-(8,44)
(8,46)-(8,59)
(8,47)-(8,53)
(8,48)-(8,49)
(8,50)-(8,52)
(8,56)-(8,58)
(8,62)-(8,63)
*)
