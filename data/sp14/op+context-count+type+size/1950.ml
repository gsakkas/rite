
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f (a1,a2) (x1,x2) =
      ((((x1 + x2) + a1) / 10), ((((x1 + x2) + a1) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.combine ((List.rev 0) :: l1) ((List.rev 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f (a1,a2) (x1,x2) =
      ((((x1 + x2) + a1) / 10), ((((x1 + x2) + a1) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,31)-(16,48)
(16,40)-(16,41)
(16,52)-(16,69)
(16,61)-(16,62)
*)

(* type error slice
(16,31)-(16,39)
(16,31)-(16,41)
(16,40)-(16,41)
(16,52)-(16,60)
(16,52)-(16,62)
(16,61)-(16,62)
*)
