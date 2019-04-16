
let rec mulByDigit i l =
  match l with
  | [] -> [0]
  | x::x' -> [[(x * i) / 10]; ((x * i) mod 10) + (mulByDigit i x')];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,3)-(5,68)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(5,70)
(2,20)-(5,68)
(2,22)-(5,68)
(3,3)-(5,68)
(4,11)-(4,14)
(4,12)-(4,13)
(5,14)-(5,68)
(5,15)-(5,29)
(5,31)-(5,67)
(5,50)-(5,67)
(5,51)-(5,61)
*)
