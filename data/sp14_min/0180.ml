
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (list2,res) ->
          (match list2 with
           | [] -> ([], res)
           | h::t ->
               (match res with
                | [] -> (t, ((h + x) :: res))
                | h2::t2 ->
                    if h2 >= 10
                    then
                      (t,
                        ((if t != []
                          then ((h + x) + 1) :: (h2 mod 10) :: t2
                          else
                            if ((h + x) + 1) >= 10
                            then 1 :: (((h + x) + 1) mod 10) :: (h2 mod 10)
                              :: t2
                            else ((h + x) + 1) :: (h2 mod 10) :: t2)))
                    else
                      (t,
                        (if t != []
                         then (h + x) :: res
                         else
                           if (h + x) >= 10
                           then 1 :: ((h + x) mod 10) :: res
                           else (h + x) :: res)))) in
    let base = ((List.rev l2), []) in
    let args = List.rev l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then []
  else
    if i = 1
    then l
    else bigAdd (mulByDigit (i - 2) l) ((mulByDigit i) - (2 l));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (list2,res) ->
          (match list2 with
           | [] -> ([], res)
           | h::t ->
               (match res with
                | [] -> (t, ((h + x) :: res))
                | h2::t2 ->
                    if h2 >= 10
                    then
                      (t,
                        ((if t != []
                          then ((h + x) + 1) :: (h2 mod 10) :: t2
                          else
                            if ((h + x) + 1) >= 10
                            then 1 :: (((h + x) + 1) mod 10) :: (h2 mod 10)
                              :: t2
                            else ((h + x) + 1) :: (h2 mod 10) :: t2)))
                    else
                      (t,
                        (if t != []
                         then (h + x) :: res
                         else
                           if (h + x) >= 10
                           then 1 :: ((h + x) mod 10) :: res
                           else (h + x) :: res)))) in
    let base = ((List.rev l2), []) in
    let args = List.rev l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then []
  else
    if i = 1 then l else bigAdd (mulByDigit (i - 2) l) (mulByDigit (i - 2) l);;

*)

(* changed spans
(51,40)-(51,64)
mulByDigit (i - 2) l
AppG [BopG EmptyG EmptyG,VarG]

*)

(* type error slice
(4,4)-(7,80)
(4,13)-(7,78)
(4,16)-(7,78)
(6,55)-(6,71)
(6,56)-(6,67)
(6,68)-(6,70)
(12,4)-(43,37)
(12,12)-(43,35)
(12,15)-(43,35)
(43,19)-(43,34)
(43,20)-(43,27)
(43,31)-(43,33)
(51,10)-(51,16)
(51,10)-(51,64)
(51,17)-(51,39)
(51,18)-(51,28)
(51,40)-(51,64)
(51,41)-(51,55)
(51,42)-(51,52)
(51,58)-(51,63)
(51,59)-(51,60)
*)
