let rec wwhile =
  fun (f , b) ->
    (let (b' , c') = f b in
     if c'
     then wwhile (f , b')
     else b')

let fixpoint =
  fun (f , b) ->
    (let foo =
       fun f ->
         fun b ->
           (let result = f b in
            if result = b
            then (result , false)
            else (result , true)) in
     wwhile (__var_1__ , b))


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    wwhile (__var_1__ , __var_2__)

let fixpoint =
  fun (f , b) ->
    (let foo =
       fun f ->
         fun b ->
           (let result = f b in
            if result = b
            then (result , false)
            else (result , true)) in
     wwhile (__var_1__ , b))


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) -> wwhile __lit__

let fixpoint =
  fun (f , b) ->
    (let foo =
       fun f ->
         fun b ->
           (let result = f b in
            if result = b
            then (result , false)
            else (result , true)) in
     wwhile (__var_1__ , b))


(* -------------------------------------- *)


(* bad

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo f b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;

*)

(* student fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;

*)

(* changed spans

(5,11)-(7,59)
fun b ->
  (let result = f b in
   if result = b
   then (result , false)
   else (result , true))
LamG VarPatG (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)
