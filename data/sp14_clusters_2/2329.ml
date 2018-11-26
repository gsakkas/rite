
let rec clone x n =
  let accum = [] in if n < 1 then [] else (clone x) :: ((accum n) - 1);;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(3,42)-(3,51)
clone x n
AppG (fromList [VarG])

*)
