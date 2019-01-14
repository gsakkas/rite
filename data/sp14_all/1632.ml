
let rec wwhile (f,b) = match f with | (n,boo) -> f b;;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

*)

(* changed spans
(2,29)-(2,30)
match f b with
| (x , true) -> wwhile (f , x)
| (x , false) -> x
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

*)
