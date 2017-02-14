
let rec mulByDigit i l =
  let f a x =
    match a with
    | (carry,rest) ->
        let new_carry = ((i * x) + carry) / 10 in
        let result = (((i * x) + carry) mod 10) :: rest in
        if ((List.length result) = (List.length l)) && (new_carry > 0)
        then (0, (new_carry :: result))
        else (new_carry, result) in
  let base = (0, []) in let (_,res) = List.fold_right f base l in res;;


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
(11,25)-(11,70)
(11,39)-(11,54)
(11,62)-(11,63)
*)

(* type error slice
(3,3)-(11,70)
(3,9)-(10,32)
(3,11)-(10,32)
(4,5)-(10,32)
(6,9)-(10,32)
(6,27)-(6,32)
(6,31)-(6,32)
(7,9)-(10,32)
(8,9)-(10,32)
(9,15)-(9,38)
(11,39)-(11,54)
(11,39)-(11,63)
(11,55)-(11,56)
*)
