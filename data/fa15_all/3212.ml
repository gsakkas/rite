
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let h::t = l in
     if h = [] then [] else (match t with | [] -> h | _ -> [(h * i) / 10]));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(6,4)-(7,75)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(7,50)-(7,51)
[(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                        [x'] @ x''))
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(7,59)-(7,73)
(@)
VarG

(7,61)-(7,62)
x
VarG

*)
