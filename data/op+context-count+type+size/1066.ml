
let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | _ -> l;;

let rec mulByDigit i l =
  let lre = List.rev l in
  let rec helper carry accum lrev =
    match lrev with
    | [] -> removeZero accum
    | x::xs ->
        if carry = 1
        then
          (match accum with
           | x1'::xs' ->
               let num = (x * i) + x1' in
               if num < 10
               then (helper 0 num) :: (xs' xs)
               else (helper 1 ((num / 10) mod 10)) :: (num mod 10) ::
                 (xs' xs))
        else
          (let num = x * i in
           if num < 10
           then (helper 0 num) :: (accum xs)
           else (helper 1 ((num / 10) mod 10)) :: (num mod 10) :: (accum xs)) in
  helper 0 [] lre;;


(* fix

let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | _ -> l;;

let rec mulByDigit i l =
  let lre = List.rev l in
  let rec helper carry accum lrev =
    match lrev with
    | [] -> removeZero accum
    | x::xs ->
        if carry = 1
        then
          (match accum with
           | x1'::xs' ->
               let num = (x * i) + x1' in
               if num < 10
               then helper 0 (num :: xs') xs
               else helper 1 (((num / 10) mod 10) :: (num mod 10) :: xs') xs)
        else
          (let num = x * i in
           if num < 10
           then helper 0 (num :: accum) xs
           else helper 1 (((num / 10) mod 10) :: (num mod 10) :: accum) xs) in
  helper 0 [] lre;;

*)

(* changed spans
(17,22)-(17,34)
(17,22)-(17,46)
(17,31)-(17,34)
(17,40)-(17,46)
(18,22)-(18,49)
(18,22)-(19,25)
(18,33)-(18,49)
(19,19)-(19,25)
(23,18)-(23,30)
(23,18)-(23,44)
(23,27)-(23,30)
(23,36)-(23,44)
(24,18)-(24,45)
(24,18)-(24,76)
(24,29)-(24,45)
(24,68)-(24,76)
*)

(* type error slice
(3,3)-(3,70)
(3,41)-(3,51)
(3,41)-(3,54)
(3,52)-(3,54)
(6,3)-(25,18)
(6,13)-(6,21)
(6,13)-(6,23)
(6,22)-(6,23)
(7,3)-(25,18)
(7,18)-(24,76)
(7,24)-(24,76)
(7,30)-(24,76)
(8,5)-(24,76)
(8,11)-(8,15)
(9,13)-(9,23)
(9,13)-(9,29)
(9,24)-(9,29)
(11,12)-(11,17)
(11,12)-(11,21)
(11,20)-(11,21)
(13,12)-(19,25)
(15,16)-(19,25)
(15,27)-(15,39)
(17,22)-(17,28)
(17,22)-(17,34)
(17,29)-(17,30)
(17,31)-(17,34)
(17,40)-(17,43)
(17,40)-(17,46)
(17,44)-(17,46)
(19,19)-(19,22)
(19,19)-(19,25)
(19,23)-(19,25)
(23,36)-(23,41)
(23,36)-(23,44)
(23,42)-(23,44)
(24,68)-(24,73)
(24,68)-(24,76)
(24,74)-(24,76)
(25,3)-(25,9)
(25,3)-(25,18)
(25,10)-(25,11)
(25,12)-(25,14)
(25,15)-(25,18)
*)
