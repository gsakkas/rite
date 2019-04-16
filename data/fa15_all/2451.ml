
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      if (List.length a2) = ((List.length l1) - 1)
      then (((sum / 10) :: a1), ((sum / 10) :: (sum mod 10) :: a2))
      else (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let test = match a with | [] -> 1 | h::t -> 10 * h in
    let multi = mulByDigit (test * x) l1 in ((test :: a), (bigAdd multi a)) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      if (List.length a2) = ((List.length l1) - 1)
      then (((sum / 10) :: a1), ((sum / 10) :: (sum mod 10) :: a2))
      else (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (a1,a2) = a in
    let test = match a1 with | [] -> 1 | h::t -> 10 * h in
    let multi = mulByDigit (test * x) l1 in ((test :: a1), (bigAdd multi a2)) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(37,5)-(38,76)
let (a1 , a2) = a in
let test =
  match a1 with
  | [] -> 1
  | h :: t -> 10 * h in
let multi =
  mulByDigit (test * x) l1 in
(test :: a1 , bigAdd multi a2)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(36,3)-(40,76)
(36,9)-(38,76)
(36,11)-(38,76)
(37,5)-(38,76)
(37,16)-(37,55)
(37,22)-(37,23)
(38,5)-(38,76)
(38,45)-(38,76)
(40,43)-(40,57)
(40,43)-(40,69)
(40,58)-(40,59)
*)
