
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
(12,24)-(12,31)
(12,24)-(12,42)
(12,35)-(12,42)
*)

(* type error slice
(11,26)-(11,31)
(11,26)-(11,41)
(12,24)-(12,29)
(12,24)-(12,31)
(12,24)-(12,42)
(12,24)-(12,42)
(12,24)-(12,48)
(12,44)-(12,45)
*)
