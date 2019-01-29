
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
(51,40)-(51,54)
mulByDigit (i - 2) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

(51,52)-(51,53)
i - 2
BopG VarG LitG

*)
