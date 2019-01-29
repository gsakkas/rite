
let rec mulByDigit i l =
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (((hd * i) mod 10) + (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;


(* fix

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> [a + hd] in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

*)

(* changed spans
(3,2)-(10,15)
b
VarG

(3,2)-(10,15)
a
VarG

(3,2)-(10,15)
a
VarG

(3,2)-(10,15)
hd
VarG

(3,2)-(10,15)
fun a ->
  fun b ->
    match b with
    | [] -> [a]
    | hd :: tl -> [a + hd]
LamG (LamG EmptyG)

(3,2)-(10,15)
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,2)-(10,15)
a + hd
BopG VarG VarG

(3,2)-(10,15)
let comb =
  fun a ->
    fun b ->
      match b with
      | [] -> [a]
      | hd :: tl -> [a + hd] in
let rec mBDhelper =
  fun i ->
    fun x ->
      match x with
      | [] -> []
      | hd :: tl -> if ((hd * i) - 9) <> 0
                    then ((hd * i) / 10) :: (comb ((hd * i) mod 10)
                                                  (mBDhelper i
                                                             tl))
                    else (hd * i) :: (mBDhelper i
                                                tl) in
mBDhelper i l
LetG NonRec (fromList [LamG EmptyG]) (LetG Rec (fromList [EmptyG]) EmptyG)

(3,2)-(10,15)
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
CaseG VarG (fromList [(Nothing,ListG EmptyG Nothing)])

(3,2)-(10,15)
[a]
ListG VarG Nothing

(3,2)-(10,15)
[a + hd]
ListG (BopG EmptyG EmptyG) Nothing

(8,32)-(8,70)
comb ((hd * i) mod 10)
     (mBDhelper i tl)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(8,33)-(8,50)
comb
VarG

*)
