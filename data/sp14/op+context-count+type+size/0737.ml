
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in (asd3, (padZero asd3 (asd2 :: b)))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in
        let (_,asd4) = padZero asd3 (asd2 :: b) in (asd3, asd4)
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,33)-(25,37)
(25,33)-(25,63)
(26,13)-(26,14)
(27,5)-(28,78)
(28,5)-(28,78)
(28,31)-(28,78)
*)

(* type error slice
(8,4)-(12,78)
(8,13)-(12,75)
(8,16)-(12,75)
(9,3)-(12,75)
(10,3)-(12,75)
(11,10)-(11,47)
(19,5)-(28,78)
(19,11)-(26,29)
(19,13)-(26,29)
(20,7)-(26,29)
(20,7)-(26,29)
(20,22)-(20,23)
(21,7)-(26,29)
(21,7)-(26,29)
(23,9)-(25,63)
(24,9)-(25,63)
(25,9)-(25,63)
(25,33)-(25,63)
(25,40)-(25,47)
(25,40)-(25,63)
(25,54)-(25,63)
(25,62)-(25,63)
(26,13)-(26,29)
(26,18)-(26,29)
(28,45)-(28,59)
(28,45)-(28,71)
(28,60)-(28,61)
*)
