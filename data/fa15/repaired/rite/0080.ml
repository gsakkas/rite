let rec wwhile =
  fun (f , b) ->
    (let (b' , c') = f b in
     if c'
     then wwhile (f , b')
     else b')

let fixpoint =
  fun (f , b) ->
    (let result = f b in
     if result = b
     then b
     else wwhile (__lit__ , result))


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    (let (b' , c') = f b in
     if c'
     then wwhile (f , b')
     else b')

let fixpoint =
  fun (f , b) ->
    (let result = f b in
     if result = b
     then b
     else wwhile (__var_1__ , result))


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    (let (b' , c') = f b in
     if c'
     then wwhile (__var_1__ , b')
     else b')

let fixpoint =
  fun (f , b) ->
    (let result = f b in
     if result = b
     then b
     else wwhile (__lit__ , result))


(* -------------------------------------- *)


(* bad

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let result = f b in if result = b then b else wwhile (f, result);;

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

(5,3)-(5,67)
let foo =
  fun b ->
    (let result = f b in
     if result = b
     then (result , false)
     else (result , true)) in
wwhile (foo , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)
