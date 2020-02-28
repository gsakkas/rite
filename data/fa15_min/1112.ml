
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
          (match h with
           | (fir,sec) ->
               (match a with
                | h::t -> ((fir + sec) + (h / 10)) ::
                    (((fir + sec) + h) mod 10) :: t)) in
    let base = [] in
    let args = List.combine l1 l2 in List.fold_left f base args in
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
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,7)-(24,54)
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
LetG NonRec [(VarPatG,BopG EmptyG EmptyG)] (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG)])

(26,16)-(26,34)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

*)

(* type error slice
(17,5)-(26,64)
(17,11)-(24,54)
(17,13)-(24,54)
(18,7)-(24,54)
(18,13)-(18,14)
(26,5)-(26,64)
(26,16)-(26,28)
(26,16)-(26,34)
(26,38)-(26,52)
(26,38)-(26,64)
(26,53)-(26,54)
(26,60)-(26,64)
*)
