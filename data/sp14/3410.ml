
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
(18,21)-(19,26)
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: xs'))
       xs
AppG [LitG,AppG [EmptyG,EmptyG],VarG]

(23,17)-(23,45)
helper 0 (num :: accum) xs
AppG [LitG,AppG [EmptyG,EmptyG],VarG]

(24,17)-(24,77)
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: accum))
       xs
AppG [LitG,AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(13,11)-(19,27)
(17,21)-(17,27)
(17,21)-(17,45)
(17,30)-(17,42)
(18,21)-(18,51)
(18,21)-(19,26)
(18,22)-(18,28)
(18,31)-(18,50)
(18,55)-(18,67)
(18,55)-(19,26)
(19,18)-(19,26)
(19,19)-(19,22)
*)
