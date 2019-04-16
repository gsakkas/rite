
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((10 * h) * i) + (mulByDigit i t);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i > 0 then mulByDigit (i - 1) (bigAdd l l) else l;;

*)

(* changed spans
(3,3)-(5,46)
if i > 0
then mulByDigit (i - 1)
                (bigAdd l l)
else l
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) VarG

*)

(* type error slice
(2,4)-(5,48)
(2,20)-(5,46)
(2,22)-(5,46)
(3,3)-(5,46)
(4,11)-(4,13)
(5,13)-(5,46)
(5,30)-(5,46)
(5,31)-(5,41)
*)
