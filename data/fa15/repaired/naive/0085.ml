let rec wwhile =
  fun (f , b) ->
    (let (b' , c') = f b in
     if c' = true
     then wwhile __lit__
     else b')


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    (let (b' , c') = f b in
     if c' = true
     then wwhile __var_1__
     else b')


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    (let (b' , c') = f b in
     if c' = true
     then wwhile (- __var_1__)
     else b')


(* -------------------------------------- *)


(* bad

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile f b' else b';;

*)

(* student fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans

(3,27)-(3,36)
c'
VarG

(3,42)-(3,53)
wwhile (f , b')
AppG [TupleG [EmptyG,EmptyG]]

*)
