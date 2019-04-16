
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  ((((clone 0 leng1) - leng2) @ l1), (((clone 0 leng2) - leng1) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng1 - leng2)) @ l1), ((clone 0 (leng2 - leng1)) @ l2));;

*)

(* changed spans
(7,5)-(7,30)
clone 0 (leng1 - leng2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(7,39)-(7,64)
clone 0 (leng2 - leng1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(7,4)-(7,36)
(7,5)-(7,30)
(7,6)-(7,21)
(7,7)-(7,12)
(7,31)-(7,32)
(7,38)-(7,70)
(7,39)-(7,64)
(7,40)-(7,55)
(7,41)-(7,46)
(7,65)-(7,66)
*)
