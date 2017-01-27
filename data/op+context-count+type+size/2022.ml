
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
(51,42)-(51,54)
(51,42)-(51,62)
(51,53)-(51,54)
(51,59)-(51,62)
*)

(* type error slice
(2,41)-(2,46)
(2,41)-(2,55)
(2,47)-(2,48)
(2,50)-(2,55)
(4,4)-(7,80)
(4,13)-(7,77)
(4,16)-(7,77)
(5,3)-(7,77)
(5,7)-(5,18)
(5,7)-(5,21)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(6,9)-(6,11)
(6,9)-(6,76)
(6,14)-(6,25)
(6,14)-(6,76)
(6,27)-(6,32)
(6,27)-(6,70)
(6,33)-(6,34)
(6,37)-(6,70)
(6,74)-(6,76)
(10,3)-(10,71)
(10,59)-(10,69)
(10,59)-(10,71)
(10,70)-(10,71)
(12,4)-(43,37)
(12,12)-(43,33)
(12,15)-(43,33)
(13,3)-(43,33)
(13,12)-(42,78)
(14,5)-(42,78)
(14,11)-(40,47)
(14,13)-(40,47)
(15,7)-(40,47)
(15,13)-(15,14)
(17,12)-(40,47)
(17,18)-(17,23)
(18,21)-(18,23)
(18,21)-(18,28)
(18,25)-(18,28)
(21,31)-(21,36)
(21,31)-(21,44)
(21,35)-(21,36)
(21,41)-(21,44)
(41,5)-(42,78)
(41,18)-(41,26)
(41,18)-(41,29)
(41,18)-(41,34)
(41,27)-(41,29)
(41,32)-(41,34)
(42,5)-(42,78)
(42,16)-(42,24)
(42,16)-(42,27)
(42,25)-(42,27)
(42,31)-(42,78)
(42,45)-(42,59)
(42,45)-(42,71)
(42,60)-(42,61)
(42,62)-(42,66)
(42,67)-(42,71)
(42,75)-(42,78)
(43,3)-(43,13)
(43,3)-(43,33)
(43,15)-(43,18)
(43,15)-(43,33)
(43,20)-(43,27)
(43,20)-(43,33)
(43,28)-(43,30)
(43,31)-(43,33)
(46,6)-(46,7)
(46,6)-(46,11)
(46,10)-(46,11)
(51,10)-(51,16)
(51,10)-(51,62)
(51,18)-(51,28)
(51,18)-(51,38)
(51,30)-(51,35)
(51,37)-(51,38)
(51,42)-(51,52)
(51,42)-(51,54)
(51,42)-(51,62)
(51,53)-(51,54)
(51,59)-(51,60)
(51,59)-(51,62)
(51,61)-(51,62)
*)
