
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match i with
  | i -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else (remainder i h) :: (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match i with
  | i -> []
  | _ ->
      (match l with
       | [] -> []
       | h::t ->
           if (List.length t) = 0
           then [h * i] @ (mulByDigit i t)
           else (remainder i h) :: (mulByDigit i t));;

*)

(* changed spans
(5,2)-(10,46)
match i with
| i -> []
| _ -> match l with
       | [] -> []
       | h :: t -> if List.length t = 0
                   then [h * i] @ mulByDigit i t
                   else (remainder i
                                   h) :: (mulByDigit i t)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)])),(Nothing,ListG EmptyG Nothing)])

(8,6)-(10,46)
l
VarG

(8,6)-(10,46)
match l with
| [] -> []
| h :: t -> if List.length t = 0
            then [h * i] @ mulByDigit i t
            else (remainder i
                            h) :: (mulByDigit i t)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG Nothing)])

(8,6)-(10,46)
[]
ListG EmptyG Nothing

*)
