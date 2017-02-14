
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
(12,21)-(12,42)
(12,22)-(12,31)
(12,34)-(12,41)
*)

(* type error slice
(11,24)-(11,41)
(11,25)-(11,30)
(12,20)-(12,48)
(12,21)-(12,42)
(12,21)-(12,42)
(12,22)-(12,31)
(12,23)-(12,28)
(12,43)-(12,44)
*)
