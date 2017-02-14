
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
(17,19)-(17,29)
(17,32)-(17,64)
*)

(* type error slice
(6,3)-(18,38)
(6,19)-(18,36)
(17,19)-(17,29)
(17,19)-(17,64)
(17,30)-(17,31)
*)
