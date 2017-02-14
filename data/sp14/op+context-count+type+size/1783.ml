
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let helper = if (f b) = b then ((f b), true) else ((f b), false) in
     (helper, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(7,4)-(8,17)
(7,18)-(7,69)
(7,21)-(7,26)
(7,21)-(7,30)
(7,24)-(7,25)
(7,29)-(7,30)
(7,36)-(7,49)
(7,37)-(7,42)
(7,38)-(7,39)
(7,44)-(7,48)
(7,55)-(7,69)
(8,5)-(8,16)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(6,2)-(6,8)
(6,2)-(8,17)
(7,4)-(8,17)
(7,4)-(8,17)
(7,18)-(7,69)
(7,36)-(7,49)
(8,5)-(8,16)
(8,6)-(8,12)
*)
