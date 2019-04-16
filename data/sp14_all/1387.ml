
let rec mulByDigit i l =
  let f a x =
    match a with
    | (carry,rest) ->
        let new_carry = ((i * x) + carry) / 10 in
        let result = (((i * x) + carry) mod 10) :: rest in
        if ((List.length result) = (List.length l)) && (new_carry > 0)
        then (0, (new_carry :: result))
        else (new_carry, result) in
  let base = (0, []) in
  let (_,res) = List.fold_right f base (List.rev l) in res;;


(* fix

let rec mulByDigit i l =
  let f a x =
    match a with
    | (carry,rest) ->
        let new_carry = ((i * x) + carry) / 10 in
        let result = (((i * x) + carry) mod 10) :: rest in
        if ((List.length result) = (List.length l)) && (new_carry > 0)
        then (0, (new_carry :: result))
        else (new_carry, result) in
  let base = (0, []) in
  let (_,res) = List.fold_left f base (List.rev l) in res;;

*)

(* changed spans
(12,17)-(12,52)
List.fold_left f base
               (List.rev l)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(12,59)
(3,9)-(10,33)
(3,11)-(10,33)
(4,5)-(10,33)
(6,9)-(10,33)
(6,26)-(6,33)
(6,31)-(6,32)
(7,9)-(10,33)
(8,9)-(10,33)
(10,14)-(10,33)
(12,17)-(12,32)
(12,17)-(12,52)
(12,33)-(12,34)
*)
