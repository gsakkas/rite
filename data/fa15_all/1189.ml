
let rec wwhile (f,b) = match b with | b -> f b wwhile ((f b), b);;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,54)-(2,64)
match f b with
| (h , t) -> if t = false
             then h
             else ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(2,62)-(2,63)
if t = false then h else ()
IteG (BopG EmptyG EmptyG) VarG (ConAppG Nothing (Just (TApp "unit" [])))

*)
