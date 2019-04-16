
let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> []
          | h'::t' ->
              if (List.length t') > 0
              then mulByDigit @ [(carry h i) + (remainder h' i)]
              else [remainder h i]));;


(* fix

let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> []
          | h'::t' ->
              if (List.length t') > 0
              then (mulByDigit i t) @ [(carry h i) + (remainder h' i)]
              else [remainder h i]));;

*)

(* changed spans
(17,20)-(17,30)
mulByDigit i t
AppG (fromList [VarG])

*)

(* type error slice
(6,4)-(18,39)
(6,20)-(18,37)
(17,20)-(17,30)
(17,20)-(17,65)
(17,31)-(17,32)
*)
