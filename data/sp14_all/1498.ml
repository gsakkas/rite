
let rec mulByDigit i l =
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) / 10) != 0
        then ((hd * i) mod 10) :: (((hd * i) / 10) + (mBDhelper i tl))
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
(3,3)-(10,16)
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
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (LetG Rec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(10,16)
(3,21)-(9,42)
(3,23)-(9,42)
(4,5)-(9,42)
(7,9)-(9,42)
(8,14)-(8,71)
(8,35)-(8,71)
(8,54)-(8,70)
(8,55)-(8,64)
(9,14)-(9,42)
(9,26)-(9,42)
(9,27)-(9,36)
*)
