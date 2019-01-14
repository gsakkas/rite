
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
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: xs'))
       xs
AppG (fromList [VarG,LitG,ConAppG (Just (TupleG (fromList [BopG (BopG VarG LitG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing]))) Nothing])

(18,30)-(18,49)
((num / 10) mod 10) :: ((num mod 10) :: xs')
ConAppG (Just (TupleG (fromList [BopG (BopG VarG LitG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing]))) Nothing

(23,16)-(23,30)
helper 0 (num :: accum) xs
AppG (fromList [VarG,LitG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(23,26)-(23,29)
num :: accum
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(24,16)-(24,46)
helper 1
       (((num / 10) mod 10) :: ((num mod 10) :: accum))
       xs
AppG (fromList [VarG,LitG,ConAppG (Just (TupleG (fromList [BopG (BopG VarG LitG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing]))) Nothing])

(24,26)-(24,45)
((num / 10) mod 10) :: ((num mod 10) :: accum)
ConAppG (Just (TupleG (fromList [BopG (BopG VarG LitG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing]))) Nothing

*)
