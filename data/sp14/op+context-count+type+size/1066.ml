
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
(13,10)-(19,26)
(13,10)-(19,26)
(17,20)-(17,26)
(17,20)-(17,44)
(17,29)-(17,41)
(18,20)-(18,50)
(18,20)-(19,25)
(18,20)-(19,25)
(18,21)-(18,27)
(18,30)-(18,49)
(18,54)-(18,66)
(18,54)-(19,25)
(18,54)-(19,25)
(19,17)-(19,25)
(19,18)-(19,21)
*)
