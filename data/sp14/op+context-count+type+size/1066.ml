
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
(21,12)-(24,76)
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
(13,12)-(19,25)
(13,12)-(19,25)
(17,21)-(17,27)
(17,21)-(17,45)
(17,31)-(17,41)
(18,22)-(18,28)
(18,22)-(18,49)
(18,22)-(19,25)
(18,22)-(19,25)
(18,33)-(18,49)
(18,56)-(18,66)
(18,56)-(19,25)
(18,56)-(19,25)
(19,19)-(19,22)
(19,19)-(19,25)
*)
