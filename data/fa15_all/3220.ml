
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
(3,5)-(3,11)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(10,14)-(10,15)
x
VarG

(10,51)-(10,52)
x * i
BopG VarG VarG

(10,57)-(10,59)
x
VarG

(10,57)-(10,59)
i
VarG

(10,64)-(10,66)
x'
VarG

*)
