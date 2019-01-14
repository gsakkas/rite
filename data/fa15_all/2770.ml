
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
          | [] -> if (i * h) > 10 then [carry i h] @ [remainder i h] else []
          | h'::t' ->
              let multNext x = match x with | [] -> 0 | h1::t1 -> h1 in
              if (i * h) > 10
              then
                (mulByDigit i t') @
                  ([(carry i h') + (remainder h' i)] @ [remainder h i])
              else i * h));;


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
          | [] -> if (i * h) > 10 then [carry i h] @ [remainder i h] else []
          | h'::t' ->
              let multNext x = match x with | [] -> 0 | h1::t1 -> h1 in
              if (i * h) > 10
              then
                (mulByDigit i t') @
                  ([(carry i h') + (remainder h' i)] @ [remainder h i])
              else [i * h]));;

*)

(* changed spans
(21,19)-(21,24)
[i * h]
ListG (BopG EmptyG EmptyG) Nothing

*)
