
let rec listReverse l =
  let a = [] in
  let rec get a = match a with | [] -> [] | x::xs -> [get xs; x] in get l;;


(* fix

let rec listReverse l =
  let rec getList a b = match a with | [] -> [] in getList [] l;;

*)

(* changed spans
(4,2)-(4,73)
let rec getList =
  fun a ->
    fun b ->
      match a with
      | [] -> [] in
getList [] l
LetG Rec [LamG EmptyG] (AppG [EmptyG,EmptyG])

(4,18)-(4,64)
fun b ->
  match a with
  | [] -> []
LamG (CaseG EmptyG [(Nothing,EmptyG)])

(4,24)-(4,25)
match a with
| [] -> []
CaseG VarG [(Nothing,ListG EmptyG Nothing)]

(4,68)-(4,71)
getList [] l
AppG [ListG EmptyG Nothing,VarG]

(4,72)-(4,73)
getList
VarG

(4,72)-(4,73)
[]
ListG EmptyG Nothing

*)
