
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let (h::[])::t = l in
     let (h2::[])::t2 = t in
     match t with
     | [] -> [h]
     | _ -> [(h * i) / 10] @ [mulByDigit i ([h2 + (h mod 10)] @ t2)]);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,3)-(10,70)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(10,72)
(2,20)-(10,70)
(2,22)-(10,70)
(3,3)-(10,70)
(6,5)-(10,70)
(7,6)-(10,69)
(8,6)-(10,69)
(9,14)-(9,17)
(10,13)-(10,27)
(10,13)-(10,69)
(10,14)-(10,26)
(10,28)-(10,29)
(10,30)-(10,69)
(10,31)-(10,41)
(10,31)-(10,68)
(10,44)-(10,68)
(10,45)-(10,62)
(10,46)-(10,61)
(10,63)-(10,64)
(10,65)-(10,67)
*)
