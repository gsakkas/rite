
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
(8,5)-(24,76)
(9,13)-(9,23)
(9,13)-(9,29)
(9,24)-(9,29)
(13,12)-(19,25)
(17,21)-(17,27)
(17,21)-(17,45)
(17,28)-(17,29)
(17,31)-(17,41)
(17,43)-(17,45)
(18,22)-(18,28)
(18,22)-(18,49)
(18,29)-(18,30)
(18,33)-(18,49)
(19,19)-(19,22)
(19,19)-(19,25)
(19,23)-(19,25)
(21,12)-(24,76)
(21,22)-(21,27)
(23,18)-(23,24)
(23,18)-(23,30)
(23,25)-(23,26)
(23,27)-(23,30)
(23,36)-(23,41)
(23,36)-(23,44)
(23,42)-(23,44)
(24,18)-(24,24)
(24,18)-(24,45)
(24,25)-(24,26)
(24,29)-(24,45)
(24,68)-(24,73)
(24,68)-(24,76)
(24,74)-(24,76)
*)
