
let rec mulByDigit i l =
  if l = []
  then []
  else (let (h::[])::t = l in match t with | [] -> h | _ -> [(h * i) / 10]);;


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

(5,51)-(5,52)
[(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                        [x'] @ x''))
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(5,60)-(5,74)
(@)
VarG

(5,62)-(5,63)
x
VarG

*)
