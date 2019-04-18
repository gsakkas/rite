
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
(17,21)-(17,47)
helper 0 (num :: xs') xs
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

(18,21)-(19,26)
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: xs'))
       xs
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

(23,17)-(23,45)
helper 0 (num :: accum) xs
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

(24,17)-(24,77)
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: accum))
       xs
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(3,3)-(3,70)
(3,41)-(3,51)
(3,41)-(3,54)
(3,52)-(3,54)
(7,3)-(25,18)
(7,18)-(24,78)
(7,24)-(24,78)
(7,30)-(24,78)
(9,13)-(9,23)
(9,13)-(9,29)
(9,24)-(9,29)
(13,11)-(19,27)
(17,39)-(17,47)
(17,40)-(17,43)
(18,21)-(18,51)
(18,21)-(19,26)
(18,22)-(18,28)
(18,55)-(18,67)
(18,55)-(19,26)
(19,18)-(19,26)
(19,19)-(19,22)
(23,35)-(23,45)
(23,36)-(23,41)
(24,67)-(24,77)
(24,68)-(24,73)
(25,3)-(25,9)
(25,3)-(25,18)
*)
