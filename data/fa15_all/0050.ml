
let pipe fs =
  let f a x a x n = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g b y n = match n with | [] -> n | _ -> y b in
  let base = f 0 [] in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,23)
fun g ->
  fun b ->
    fun y ->
      fun n ->
        match n with
        | [] -> n
        | _ -> y b
LamG (LamG EmptyG)

(3,16)-(3,23)
fun b ->
  fun y ->
    fun n ->
      match n with
      | [] -> n
      | _ -> y b
LamG (LamG EmptyG)

(3,16)-(3,23)
fun y ->
  fun n ->
    match n with
    | [] -> n
    | _ -> y b
LamG (LamG EmptyG)

(3,20)-(3,23)
n
VarG

(3,20)-(3,23)
n
VarG

(3,20)-(3,23)
match n with
| [] -> n
| _ -> y b
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(3,22)-(3,23)
y
VarG

(3,27)-(3,67)
b
VarG

(3,38)-(3,39)
f
VarG

(3,38)-(3,39)
f 0 []
AppG (fromList [LitG,ListG EmptyG Nothing])

(3,43)-(3,67)
[]
ListG EmptyG Nothing

*)
