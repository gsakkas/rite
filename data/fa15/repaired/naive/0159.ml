let rec wwhile =
  fun (f , b) ->
    match f b with
    | (x , false) -> x
    | (y , true) -> wwhile (f , y)

let fixpoint =
  fun (f , b) -> wwhile b


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    match f b with
    | (x , false) -> x
    | (y , true) -> wwhile (f , y)

let fixpoint =
  fun (f , b) -> wwhile f


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    match f b with
    | (x , false) -> x
    | (y , true) -> wwhile (f , y)

let fixpoint =
  fun (f , b) ->
    wwhile (__fun_1__ __var_1__)


(* -------------------------------------- *)


(* bad

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else (b, true)), b);;

*)

(* student fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans

(6,11)-(6,56)
fun x -> (x , f x = x)
LamG VarPatG (TupleG [EmptyG,EmptyG])

*)
