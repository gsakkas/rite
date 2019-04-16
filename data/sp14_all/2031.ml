
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> ((((clone 0) - lendiff) @ l1), l2));;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

*)

(* changed spans
(12,22)-(12,43)
clone 0 (- lendiff)
AppG (fromList [UopG EmptyG,LitG])

*)

(* type error slice
(11,25)-(11,42)
(11,26)-(11,31)
(12,21)-(12,49)
(12,22)-(12,43)
(12,23)-(12,32)
(12,24)-(12,29)
(12,44)-(12,45)
*)
