
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
(5,3)-(10,47)
match i with
| i -> []
| _ -> match l with
       | [] -> []
       | h :: t -> if List.length t = 0
                   then [h * i] @ mulByDigit i t
                   else (remainder i
                                   h) :: (mulByDigit i t)
CaseG VarG [(VarPatG,Nothing,ListG []),(WildPatG,Nothing,CaseG EmptyG [(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG)])]

(8,7)-(10,47)
match l with
| [] -> []
| h :: t -> if List.length t = 0
            then [h * i] @ mulByDigit i t
            else (remainder i
                            h) :: (mulByDigit i t)
CaseG VarG [(ConPatG Nothing,Nothing,ListG []),(ConsPatG EmptyPatG EmptyPatG,Nothing,IteG EmptyG EmptyG EmptyG)]

*)

(* type error slice
(5,3)-(10,47)
(5,9)-(5,10)
(9,13)-(9,18)
(9,17)-(9,18)
*)
