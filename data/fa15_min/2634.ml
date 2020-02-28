
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      ([(x1 + x2) / 10], ((((a1 + x1) + x2) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      (((x1 + x2) / 10), ((((a1 + x1) + x2) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,8)-(20,24)
(x1 + x2) / 10
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(17,5)-(23,52)
(17,11)-(20,60)
(17,13)-(20,60)
(18,7)-(20,60)
(19,7)-(20,60)
(19,21)-(19,22)
(20,7)-(20,60)
(20,8)-(20,24)
(20,29)-(20,38)
(20,30)-(20,32)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
*)
