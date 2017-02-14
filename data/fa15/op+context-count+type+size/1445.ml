
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
          | [] -> if (i * h) > 10 then [carry i h] @ [remainder i h]
          | h'::t' ->
              (mulByDigit i t') @
                ([(remainder h' i) + (carry h i)] @ [remainder h i])));;


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
          | [] ->
              if (i * h) > 10
              then [carry i h] @ [remainder i h]
              else [remainder i h]
          | h'::t' ->
              (mulByDigit i t') @
                ([(remainder h' i) + (carry h i)] @ [remainder h i])));;

*)

(* changed spans
(14,18)-(14,68)
(16,32)-(16,33)
(17,53)-(17,62)
(17,63)-(17,64)
(17,65)-(17,66)
*)

(* type error slice
(14,18)-(14,68)
(14,18)-(14,68)
(14,18)-(14,68)
(14,39)-(14,68)
(14,51)-(14,52)
*)
