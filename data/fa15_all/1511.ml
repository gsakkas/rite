
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2)) l2)));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

*)

(* changed spans
(10,11)-(10,75)
List.append (clone 0
                   (List.length l1 - List.length l2))
            l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(10,24)-(10,74)
clone 0
      (List.length l1 - List.length l2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)
