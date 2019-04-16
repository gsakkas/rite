
let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let ll1 = List.length l1 in
  let ll2 = List.length l2 in
  (((clone 0 (ll2 - ll1)) @ l1), ((clone 0 (ll1 - ll2)) @ l2));;

let rec removeZero l =
  match l with | h::t -> if h == 0 then removeZero t else h :: t | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f (c,ds) (x1,x2) = ((((c + x1) + x2) / 10), (((c + x1) + x2) mod 10)) in
    let base = (0, 1) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let ll1 = List.length l1 in
  let ll2 = List.length l2 in
  (((clone 0 (ll2 - ll1)) @ l1), ((clone 0 (ll1 - ll2)) @ l2));;

let rec removeZero l =
  match l with | h::t -> if h == 0 then removeZero t else h :: t | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f (c,ds) (x1,x2) =
      ((((c + x1) + x2) / 10), ((((c + x1) + x2) mod 10) :: ds)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,53)-(15,77)
(((c + x1) + x2) mod 10) :: ds
ConAppG (Just (TupleG (fromList [EmptyG])))

(16,20)-(16,21)
[]
ListG (fromList [])

*)

(* type error slice
(11,3)-(11,76)
(11,41)-(11,51)
(11,41)-(11,53)
(11,52)-(11,53)
(14,3)-(19,35)
(14,12)-(18,52)
(15,5)-(18,52)
(15,12)-(15,78)
(15,19)-(15,78)
(15,28)-(15,78)
(15,53)-(15,77)
(16,5)-(18,52)
(17,5)-(18,52)
(18,5)-(18,52)
(18,19)-(18,33)
(18,19)-(18,45)
(18,34)-(18,35)
(18,49)-(18,52)
(19,3)-(19,13)
(19,3)-(19,35)
(19,14)-(19,35)
(19,15)-(19,18)
*)
