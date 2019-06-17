
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | h::t ->
          (match a with
           | hd::tl -> ((((fst h) + (snd h)) + hd) / 10) ::
               ((((fst h) + (snd h)) + hd) mod 10) :: tl) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | hd::tl -> ((((fst x) + (snd x)) + hd) / 10) ::
          ((((fst x) + (snd x)) + hd) mod 10) :: tl in
    let base = [] in
    let args = List.combine l1 l2 in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,7)-(22,58)
match a with
| hd :: tl -> (((fst x + snd x) + hd) / 10) :: ((((fst x + snd x) + hd) mod 10) :: tl)
CaseG VarG [(ConsPatG EmptyPatG EmptyPatG,Nothing,AppG [EmptyG,EmptyG])]

(24,16)-(24,45)
List.combine l1 l2
AppG [VarG,VarG]

*)

(* type error slice
(17,5)-(24,75)
(17,11)-(22,58)
(17,13)-(22,58)
(18,7)-(22,58)
(18,13)-(18,14)
(24,5)-(24,75)
(24,16)-(24,24)
(24,16)-(24,45)
(24,25)-(24,45)
(24,26)-(24,38)
(24,49)-(24,63)
(24,49)-(24,75)
(24,64)-(24,65)
(24,71)-(24,75)
*)
