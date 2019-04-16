
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let h::t = l in
     let h2::t2 = t in
     match t with
     | [] -> h
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
CaseG VarG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(3,3)-(10,70)
(4,8)-(4,10)
(6,5)-(10,70)
(7,6)-(10,69)
(8,6)-(10,69)
(9,14)-(9,15)
(10,13)-(10,69)
(10,14)-(10,21)
(10,15)-(10,16)
(10,28)-(10,29)
*)
