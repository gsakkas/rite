
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let (h::[])::t = l in
     match t with
     | [] -> [h]
     | _ ->
         [(h * i) / 10] @
           (mulByDigit i
              [(let (h2::[])::t2 = t in [h2 + ((h * i) mod 10)] @ [t2])]));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,5)-(3,11)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(10,11)-(10,12)
x
VarG

(12,48)-(12,49)
x
VarG

(12,66)-(12,70)
x'
VarG

(12,66)-(12,70)
mulByDigit
VarG

(12,66)-(12,70)
i
VarG

(12,66)-(12,70)
(@)
VarG

(12,66)-(12,70)
mulByDigit i [x'] @ x''
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(12,66)-(12,70)
mulByDigit i [x']
AppG (fromList [VarG,ListG EmptyG Nothing])

(12,67)-(12,69)
x'
VarG

*)
