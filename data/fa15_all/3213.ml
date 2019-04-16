
let rec mulByDigit i l =
  if l = []
  then []
  else (let h::t = l in match t with | [] -> h | _ -> [(h * i) / 10]);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,3)-(5,70)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(3,3)-(5,70)
(4,8)-(4,10)
(5,8)-(5,70)
(5,25)-(5,69)
(5,46)-(5,47)
(5,55)-(5,69)
(5,56)-(5,63)
(5,57)-(5,58)
*)
