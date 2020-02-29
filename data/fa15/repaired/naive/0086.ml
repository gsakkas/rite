let rec digitsOfInt =
  fun n ->
    (let return = [n mod 10] in
     if (n / 10) <> 0
     then ((n mod 10) :: return;
     digitsOfInt (n / 10) @ return)
     else return)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> 0
    | h :: t -> h + sumList t

let rec additivePersistence =
  fun n -> digitsOfInt 10


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [n mod 10] in
     if (n / 10) <> 0
     then ((n mod 10) :: return;
     digitsOfInt (n / 10) @ return)
     else return)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> 0
    | h :: t -> h + sumList t

let rec additivePersistence =
  fun n -> digitsOfInt __lit__


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [n mod 10] in
     if (n / 10) <> 0
     then ((n mod 10) :: return;
     digitsOfInt (n / 10) @ return)
     else return)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> 0
    | h :: t -> h + sumList t

let rec additivePersistence =
  fun n -> digitsOfInt (- 10)


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = sumList digitsOfInt n;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = let digits = digitsOfInt n in sumList digits;;

*)

(* changed spans

(10,33)-(10,54)
let digits = digitsOfInt n in
sumList digits
LetG NonRec [(VarPatG,AppG [EmptyG])] (AppG [EmptyG])

*)
