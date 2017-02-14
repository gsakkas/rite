
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 10
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        if (let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) = 10)
        then (1, 9)
        else
          (let (carry,ans) = a in
           (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 10
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        if (let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) = 10)
        then (let (carry,ans) = a in (1, ([9] @ ans)))
        else
          (let (carry,ans) = a in
           (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,15)-(21,19)
(21,18)-(21,19)
(23,12)-(24,57)
(28,15)-(28,18)
(28,20)-(28,27)
(28,20)-(28,33)
(28,28)-(28,30)
(28,31)-(28,33)
*)

(* type error slice
(15,7)-(24,57)
(15,7)-(24,57)
(17,9)-(18,63)
(18,10)-(18,63)
(18,14)-(18,63)
(18,31)-(18,63)
(18,58)-(18,59)
(20,9)-(24,57)
(20,9)-(24,57)
(21,15)-(21,19)
(21,18)-(21,19)
(23,12)-(24,57)
(24,13)-(24,57)
(24,17)-(24,57)
(24,34)-(24,57)
(24,52)-(24,53)
*)
