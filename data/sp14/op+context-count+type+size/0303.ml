
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
(12,16)-(12,31)
*)

(* type error slice
(3,2)-(12,58)
(3,8)-(10,32)
(3,10)-(10,32)
(4,4)-(10,32)
(6,8)-(10,32)
(6,25)-(6,32)
(6,30)-(6,31)
(7,8)-(10,32)
(8,8)-(10,32)
(9,13)-(9,39)
(12,16)-(12,31)
(12,16)-(12,51)
(12,32)-(12,33)
*)
