
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (c,sum) ->
          (match x with
           | (d1,d2) ->
               let c' = ((c + d1) + d2) / 10 in
               let d' = ((c + d1) + d2) mod 10 in (c', (d' :: sum))) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 1
  then l
  else
    if i = 0
    then []
    else
      if i < 0
      then
        (match bigAdd (bigAdd l l) (mulByDigit ((i * (-1)) - 2) l) with
         | h::t -> (h * (-1)) :: t
         | _ -> 0)
      else bigAdd (bigAdd l l) (mulByDigit (i - 2) l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (c,sum) ->
          (match x with
           | (d1,d2) ->
               let c' = ((c + d1) + d2) / 10 in
               let d' = ((c + d1) + d2) mod 10 in (c', (d' :: sum))) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 1
  then l
  else
    if i = 0
    then []
    else
      if i < 0
      then
        (match bigAdd (bigAdd l l) (mulByDigit ((i * (-1)) - 2) l) with
         | h::t -> (h * (-1)) :: t
         | _ -> [])
      else bigAdd (bigAdd l l) (mulByDigit (i - 2) l);;

*)

(* changed spans
(37,17)-(37,18)
[]
ListG (fromList [])

*)

(* type error slice
(35,9)-(37,19)
(36,20)-(36,35)
(37,17)-(37,18)
*)
