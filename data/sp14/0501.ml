
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      let tens = (x1 + x2) + (carry / 10) in
      let ones = (x1 + x2) + (carry mod 10) in (tens, (tens :: ones :: res)) in
    let base = ([0], [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      if carry <> []
      then
        let ch::_ = carry in
        let tens = ((x1 + x2) + ch) / 10 in
        let ones = ((x1 + x2) + ch) mod 10 in ([tens], (tens :: ones :: res))
      else
        (let tens = (x1 + x2) / 10 in
         let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,7)-(23,77)
if carry <> []
then (let ch :: _ = carry in
      let tens =
        ((x1 + x2) + ch) / 10 in
      let ones =
        ((x1 + x2) + ch) mod 10 in
      ([tens] , tens :: (ones :: res)))
else (let tens =
        (x1 + x2) / 10 in
      let ones = (x1 + x2) mod 10 in
      ([tens] , tens :: (ones :: res)))
IteG (BopG EmptyG EmptyG) (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG) (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(24,17)-(24,20)
[]
ListG []

(24,22)-(24,25)
[]
ListG []

*)

(* type error slice
(19,5)-(26,52)
(19,11)-(23,77)
(21,7)-(23,77)
(21,25)-(21,26)
(22,30)-(22,42)
(22,31)-(22,36)
(24,5)-(26,52)
(24,16)-(24,26)
(24,17)-(24,20)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,36)-(26,40)
*)
