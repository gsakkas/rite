
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
(7,6)-(8,16)
(7,19)-(7,69)
(7,23)-(7,26)
(7,23)-(7,31)
(7,25)-(7,26)
(7,30)-(7,31)
(7,39)-(7,40)
(7,39)-(7,42)
(7,39)-(7,49)
(7,45)-(7,49)
(7,58)-(7,69)
(8,7)-(8,16)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,51)
(3,50)-(3,55)
(6,3)-(6,9)
(6,3)-(8,16)
(7,6)-(8,16)
(7,6)-(8,16)
(7,19)-(7,69)
(7,39)-(7,49)
(8,7)-(8,13)
(8,7)-(8,16)
*)
