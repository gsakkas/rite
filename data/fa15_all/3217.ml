
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let (h::[])::t = l in
     let (h2::[])::t2 = t in
     match t with
     | [] -> [h]
     | _ -> [(h * i) / 10] @ [(mulByDigit i [h2 + (h mod 10)]) @ t2]);;


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

(10,14)-(10,15)
x
VarG

(10,29)-(10,68)
(@)
VarG

(10,29)-(10,68)
[((x * i) mod 10) + x'] @ (mulByDigit i
                                      [x'] @ x'')
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(10,30)-(10,67)
x
VarG

(10,30)-(10,67)
i
VarG

(10,30)-(10,67)
x'
VarG

(10,30)-(10,67)
(x * i) mod 10
BopG (BopG EmptyG EmptyG) LitG

(10,30)-(10,67)
((x * i) mod 10) + x'
BopG (BopG EmptyG EmptyG) VarG

(10,30)-(10,67)
x * i
BopG VarG VarG

(10,30)-(10,67)
10
LitG

(10,65)-(10,67)
x'
VarG

*)
