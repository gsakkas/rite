
let rec mulByDigit i l =
  match l with
  | [] -> []
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
CaseG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

(5,14)-(5,68)
[(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                        [x'] @ x''))
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,70)
(2,20)-(5,68)
(2,22)-(5,68)
(3,3)-(5,68)
(5,14)-(5,68)
(5,15)-(5,29)
(5,31)-(5,67)
(5,50)-(5,67)
(5,51)-(5,61)
*)
