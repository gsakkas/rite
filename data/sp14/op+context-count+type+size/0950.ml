
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
(17,20)-(17,34)
(17,20)-(17,46)
(17,30)-(17,33)
(17,38)-(17,46)
(18,20)-(18,50)
(18,20)-(19,25)
(18,30)-(18,49)
(19,17)-(19,25)
(21,10)-(24,77)
(23,16)-(23,30)
(23,16)-(23,44)
(23,26)-(23,29)
(23,34)-(23,44)
(24,16)-(24,46)
(24,16)-(24,76)
(24,26)-(24,45)
(24,66)-(24,76)
*)

(* type error slice
(3,2)-(3,69)
(3,2)-(3,69)
(3,40)-(3,50)
(3,40)-(3,53)
(3,51)-(3,53)
(7,2)-(25,17)
(7,17)-(24,77)
(7,23)-(24,77)
(7,29)-(24,77)
(9,12)-(9,22)
(9,12)-(9,28)
(9,23)-(9,28)
(13,10)-(19,26)
(13,10)-(19,26)
(17,38)-(17,46)
(17,39)-(17,42)
(18,20)-(18,50)
(18,20)-(19,25)
(18,20)-(19,25)
(18,21)-(18,27)
(18,54)-(18,66)
(18,54)-(19,25)
(18,54)-(19,25)
(19,17)-(19,25)
(19,18)-(19,21)
(23,34)-(23,44)
(23,35)-(23,40)
(24,66)-(24,76)
(24,67)-(24,72)
(25,2)-(25,8)
(25,2)-(25,17)
*)
