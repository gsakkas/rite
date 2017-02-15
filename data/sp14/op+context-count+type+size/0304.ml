
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
(11,24)-(11,69)
(11,38)-(11,53)
(11,61)-(11,62)
*)

(* type error slice
(3,2)-(11,69)
(3,8)-(10,32)
(3,10)-(10,32)
(4,4)-(10,32)
(6,8)-(10,32)
(6,25)-(6,32)
(6,30)-(6,31)
(7,8)-(10,32)
(8,8)-(10,32)
(9,13)-(9,39)
(11,38)-(11,53)
(11,38)-(11,62)
(11,54)-(11,55)
*)
