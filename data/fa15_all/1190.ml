
let rec wwhile (f,b) = match b with | b -> wwhile ((f b), b);;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,50)-(2,60)
match f b with
| (h , t) -> if t = false
             then h
             else ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(2,58)-(2,59)
if t = false then h else ()
IteG (BopG EmptyG EmptyG) VarG (ConAppG Nothing (Just (TApp "unit" [])))

*)
