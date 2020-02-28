
let rec clone x n =
  let rec helper xs sub depth =
    match depth > 0 with
    | false  -> xs
    | true  -> helper (sub :: xs) sub (depth - 1) in
  helper [] x n;;

let rec padZero l1 l2 =
  let sizeDif = (List.length l1) - (List.length l2) in
  let appendS = clone 0 (abs sizeDif) in
  if sizeDif < 0 then ((appendS @ l1), l2) else (l1, (appendS @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (op1,op2) ->
          let res = op1 + op2 in
          let (p1,p2) = a in
          (match p2 with
           | [] -> (p1, [res / 10; res mod 10])
           | a::b ->
               let re = a + res in (p1, ((re / 10) :: (re mod 10) :: b))) in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper i l acc =
    match i with | 0 -> acc | _ -> helper (i - 1) l (bigAdd l acc) in
  helper i l [0];;

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in
    match b with
    | d::t -> (((d * 10) :: t), (bigAdd ((mulByDigit (d * x) t) c)))
    | _ -> a in
  let base = ((1 :: l2), [0]) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in match b with | d::t -> (((d * 10) :: t), t) | _ -> a in
  let base = ((1 :: l2), [0]) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(42,33)-(42,68)
t
VarG

*)

(* type error slice
(9,4)-(12,71)
(9,17)-(12,69)
(9,20)-(12,69)
(12,54)-(12,68)
(12,63)-(12,64)
(12,65)-(12,67)
(17,4)-(31,37)
(17,12)-(31,35)
(17,15)-(31,35)
(31,19)-(31,34)
(31,20)-(31,27)
(31,31)-(31,33)
(33,4)-(36,19)
(33,20)-(36,17)
(33,22)-(36,17)
(34,3)-(36,17)
(35,5)-(35,67)
(35,25)-(35,28)
(35,36)-(35,42)
(35,36)-(35,67)
(35,53)-(35,67)
(35,54)-(35,60)
(35,63)-(35,66)
(36,3)-(36,9)
(36,3)-(36,17)
(39,3)-(45,76)
(39,9)-(43,13)
(41,5)-(43,13)
(42,15)-(42,69)
(42,33)-(42,68)
(42,34)-(42,40)
(42,41)-(42,67)
(42,42)-(42,64)
(42,43)-(42,53)
(43,12)-(43,13)
(44,3)-(45,76)
(44,14)-(44,30)
(44,26)-(44,29)
(45,43)-(45,57)
(45,43)-(45,69)
(45,58)-(45,59)
(45,60)-(45,64)
*)
